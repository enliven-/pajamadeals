class User < ActiveRecord::Base
  include HasToken

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
    omniauth_providers: [:facebook], authentication_keys: [:mobile_number]

  has_many :classifieds
  has_many :picks
  belongs_to :college

  has_token

  mount_uploader :avatar, AvatarUploader

  alias_attribute :phone, :mobile_number
  alias_attribute :phone_number, :mobile_number
  alias_attribute :fname, :first_name
  alias_attribute :lname, :last_name

  validates :mobile_number, presence: true, uniqueness: true,
    format: { with: /\A[789]\d{9}\z/, message: 'Invalid number'}


  # facebook

  def self.find_for_facebook_auth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider    = auth.provider
      user.uid         = auth.uid
      user.email       = auth.info.email
      user.password    = Devise.friendly_token[0, 20]
      user.first_name  = auth.info.first_name
      user.last_name   = auth.info.last_name
      user.remote_avatar_url = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_token_expires_at =
        Time.at(auth.credentials.expires_at)
      user.location    = auth.info.location
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] &&
          session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def facebook_it(classified)
    if oauth_token_expires_at > Time.now
      @facebook ||= Koala::Facebook::API.new(oauth_token)
    end
  end

  # helpers

  def name
    first_name + ' ' + last_name
  end
  alias_method :full_name, :name

  private
  def email_required?
    false
  end
end

class User < ActiveRecord::Base
  include HasToken

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    authentication_keys: [:mobile_number]
  #  :omniauthable, omniauth_providers: [:facebook],

  has_many :classifieds
  belongs_to :college

  has_token

  mount_uploader :avatar, AvatarUploader

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

end

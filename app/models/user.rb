class User < ActiveRecord::Base

  # devise :database_authenticatable, :registerable,
#     :recoverable, :rememberable, :trackable, :validatable,
#     authentication_keys: [:mobile]
  #  :omniauthable, omniauth_providers: [:facebook],

  has_many :classifieds
  belongs_to :college

  include HasToken
  has_token

  # validates :mobile, presence: true, uniqueness: true,
 #    format: { with: /\A[789]\d{9}\z/, message: 'Invalid mobile number'}
 #  validates :name, presence: true
    
  enum role: {
    admin: 1,
    ambassador: 2,
    user: 3
  }

  # facebook

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize do |user|
      user.provider               = auth.provider
      user.uid                    = auth.uid
      user.email                  = auth.info.email if user.email.blank?
      user.name                   = auth.info.name  if user.name.blank?
      user.oauth_token            = auth.credentials.token
      user.oauth_token_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  # def self.new_with_session(params, session)
 #    super.tap do |user|
 #      if data = session['devise.facebook_data'] &&
 #          session['devise.facebook_data']['extra']['raw_info']
 #        user.email = data['email'] if user.email.blank?
 #      end
 #    end
 #  end
 #
 #  def facebook_it(classified)
 #    if oauth_token_expires_at > Time.now
 #      @facebook ||= Koala::Facebook::API.new(oauth_token)
 #    end
 #  end
  
  def owner?(record)
    record.user == self
  end
  
  def guest?
    uid.blank?
  end
  
  private
  
  before_create :save_role
  def save_role
    self.role ||= :user
  end

end

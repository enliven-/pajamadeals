OmniAuth.config.logger = Rails.logger


Rails.application.config.middleware.use OmniAuth::Builder do
 # provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']
 if Rails.env.production?
   provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'],
                     scope: 'email'
 elsif Rails.env.development?
   provider :facebook, '1496050790612397', '8527f91e1fe1095a59c8564803863a7c',
   scope: 'email'
 end
                     
end
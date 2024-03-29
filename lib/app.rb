# -*- encoding : utf-8 -*-
class App

  # class methods
  class << self

    def host
      if Rails.env.production?
        'pajamadeals.in'
      else
        'pajamadeals.dev'
      end
    end
    
    def domain
      host
    end

    def name
      'Pajama Deals'
    end

    def url
      "http://#{host}"
    end
    
    def logo
      'Pajama Deals'
    end

    def sender_email
      'bhushanlodha@gmail.com'
    end

    def sender_password
      ENV['B_PASSWORD']
    end
  end

end

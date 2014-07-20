# -*- encoding : utf-8 -*-
class App

  # class methods
  class << self

    def host
      'hasstuff.com'
    end

    def name
      'Has Stuff'
    end

    def url
      "http://#{host}"
    end

    def sender_email
      'bhushanlodha@gmail.com'
    end

    def sender_password
      ENV['B_PASSWORD']
    end
  end

end
module HasToken
	extend ActiveSupport::Concern
	module ClassMethods
		def has_token(*args)
			options = args.extract_options!
			attr    = args.shift || :token
			options[:method] ||= :urlsafe_base64
			args = [options[:length]].compact

			before_validation(on: :create) do
				self[attr] ||= SecureRandom.send(options[:method], *args)
			end
		end
	end
end

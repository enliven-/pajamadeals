class Staff < ActionMailer::Base
	default from: "blo@alum.hackerschool.com"

	def pick_request(pick)
		@pick = pick
		@classified = @pick.classified
		@seller = @classified.user
		@buyer = @pick.user
		mail(to: 'bhushanlodha@gmail.com', from: @buyer.email,
		     subject: 'Item pickup request')
	end
end

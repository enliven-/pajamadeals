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

	def send_campaign(to)
		mail(to: to, from: 'bhushanlodha@gmail.com', subject: 'Buy/Sell book among college students')
	end
end

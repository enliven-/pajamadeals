class Staff < ActionMailer::Base
	default from: "blo@alum.hackerschool.com"

	def pick_request(pick)
		@pick = pick
		@classified = @pick.classified
		@seller = @classified.user
		@buyer = @pick.user
		mail(to: 'bhushanlodha@gmail.com', from: @buyer.email,
		     subject: 'Item pickup request', message: @pick.message)

    mail(to: 'dreamz.unlimitid@gmail.com', from: @buyer.email,
         subject: 'Item pickup request: ' + @classified.book.title, message: @pick.message)
	end
end

class Pick < ActiveRecord::Base
	belongs_to :user
	belongs_to :classified

	after_create :email_staff

	private

	def email_staff
		Staff.delay.pick_request(self)
	end
end

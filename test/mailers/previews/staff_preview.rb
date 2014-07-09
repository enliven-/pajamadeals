# Preview all emails at http://localhost:3000/rails/mailers/staff
class StaffPreview < ActionMailer::Preview

	def pick_request
		classified = Classified.first
		@pick = FactoryGirl.create :pick, classified: classified, user: User.first
		Staff.pick_request(@pick)
	end
end

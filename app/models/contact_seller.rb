class ContactSeller < ActiveRecord::Base

	def new
		@contact_seller = ContactSeller.new
	end

	def create
		@contact_seller = ContactSeller(contact_seller_params)
		if @contact_seller.save
			#
		else
			#
		end
	end
end

class Book < ActiveRecord::Base
	has_many :classifieds
	mount_uploader :image, ImageUploader

	searchable do
		text :title
	end
end

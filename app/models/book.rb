class Book < ActiveRecord::Base
	has_many :classifieds
	mount_uploader :image, ImageUploader
end

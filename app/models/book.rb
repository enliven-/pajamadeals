class Book < ActiveRecord::Base
	mount :image, ImageUploader
end

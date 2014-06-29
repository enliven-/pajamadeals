class Image < ActiveRecord::Base
	belongs_to :classified

	mount_uploader :file, ImageUploader
end

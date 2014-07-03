class Book < ActiveRecord::Base
	has_many :classifieds
	mount_uploader :image, ImageUploader

	searchable do
		text :title
	end

  ### touching this ### viksit
  def description
    "Lorem ipsum dolor sit amet, consectetur... "
  end
end

class Book < ActiveRecord::Base
  has_many :classifieds
  mount_uploader :image, ImageUploader

  # search
  searchable do
    text :title
    text :author
    text :isbn
  end
end

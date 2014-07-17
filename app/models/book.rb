class Book < ActiveRecord::Base
  searchkick

  has_many :classifieds
  mount_uploader :image, ImageUploader
end

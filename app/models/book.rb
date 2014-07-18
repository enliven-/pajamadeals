class Book < ActiveRecord::Base
  searchkick

  validates :title, 	presence: true
  validates :publisher, presence: true
  validates :author, 	presence: true

  has_many :classifieds
  mount_uploader :image, ImageUploader
end

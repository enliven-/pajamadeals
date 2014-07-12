class Book < ActiveRecord::Base
  has_many :classifieds
  mount_uploader :image, ImageUploader

  alias_attribute :mrp, :retail_price
  alias_attribute :price, :retail_price

  # search
  searchable do
    text :title
    text :author
    text :isbn
  end
end

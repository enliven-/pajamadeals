class Book < ActiveRecord::Base
  searchkick

  validates :title, 	presence: true
  validate :publisher_or_author, on: :create

  has_many :classifieds
  mount_uploader :image, ImageUploader

  private

  def publisher_or_author
  	if publisher.blank? || author.blank?
  		errors.add(:base, "Either publisher or author should be present")
  	end
  end

end

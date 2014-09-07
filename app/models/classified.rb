class Classified < ActiveRecord::Base
  searchkick settings: {number_of_shards: 1}
  
  enum listing_type: { buy: 0, sell: 1 }

  validates :title, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user
  accepts_nested_attributes_for :user
  belongs_to :college
  belongs_to :category

  include HasToken
  has_token
  
  mount_uploader :image, ImageUploader
  
  def owner?(user)
    self.user == user
  end
  
  def self.search_r(params)
  end

  private

  before_create :set_college
  def set_college
    self.college ||= user.college
  end

end

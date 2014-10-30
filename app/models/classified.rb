class Classified < ActiveRecord::Base
  searchkick settings: {number_of_shards: 1}
  
  enum listing_type: { buy: 0, sell: 1 }

  has_many :orders
  belongs_to :user
  accepts_nested_attributes_for :user
  belongs_to :college
  belongs_to :category

  include HasToken
  has_token
  
  mount_uploader :image, ImageUploader
  
  scope :sold, -> { where(sold: true) }
  scope :spam, -> { where(spam: true) }
  scope :unlisted, -> { where(list: false) }
  scope :deleted, -> { where(deleted: true) }
 
  def owner
    user
  end
  
  def owner?(user)
    owner == user
  end
  
  def delete!
    self.deleted = true
    save
  end
  
  private

  before_create :set_college
  def set_college
    self.college ||= user.college
  end
  
  before_create :titleize_title
  def titleize_title
    self.title = self.title.titleize
  end

end

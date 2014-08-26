class Classified < ActiveRecord::Base
  searchkick settings: {number_of_shards: 1}

  validates :title, presence: true
  validates :price, presence: true, numericality: true
  # validates :category, existence: true

  belongs_to :user
  accepts_nested_attributes_for :user
  belongs_to :college
  belongs_to :category

  include HasToken
  has_token
  
  mount_uploader :image, ImageUploader

  private

  before_create :set_college
  def set_college
    self.college ||= user.college
  end

end

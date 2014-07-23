class Classified < ActiveRecord::Base

  BUY = 0
  SELL = 1

  validates :expected_price, presence: true, numericality: true
  validates :retail_price,   numericality: true

  belongs_to :user
  accepts_nested_attributes_for :user
  belongs_to :college
  belongs_to :category
  
  alias_attribute :selling_price, :expected_price
  alias_attribute :mrp, :retail_price

  before_create :set_college

  include HasToken
  has_token

  scope :sold, -> { where(sold: true) }

  delegate :title, :description, :publisher, :author, :isbn, :edition,
    :released_year, :university, :pages, to: :book, allow_nil: true

  def buy?
    listing_type == BUY
  end

  def sell?
    !buy?
  end

  # calcs

  def percent_off
    if retail_price.present? && retail_price.to_f > expected_price.to_f
      (((retail_price.to_f - expected_price.to_f) / retail_price.to_f) * 100).round
    end
  end

  def image
    book.image || self.images.first
  end

  private

  def set_college
    self.college_id || self.college = user.college
  end

end

class Classified < ActiveRecord::Base
  searchkick

  validates :expected_price, presence: true, numericality: true
  validates :retail_price,   numericality: true

  belongs_to :user
  accepts_nested_attributes_for :user
  belongs_to :college
  belongs_to :category

  alias_attribute :selling_price, :expected_price
  alias_attribute :mrp, :retail_price

  include HasToken
  has_token

  private

  before_create :set_college
  def set_college
    self.college  ||= user.college
  end

end

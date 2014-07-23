class Classified < ActiveRecord::Base
  searchkick

  validates :title, presence: true
  validates :price, presence: true, numericality: true

  belongs_to :user
  accepts_nested_attributes_for :user
  belongs_to :college
  belongs_to :category

  include HasToken
  has_token

  private

  before_create :set_college
  def set_college
    self.college  ||= user.college
  end

end

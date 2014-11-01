class StudentAmbassador < ActiveRecord::Base
  
  validates :name, presence: true
  validates :mobile, presence: true, numericality: true
  validates :year, presence: true
end

class StudentAmbassador < ActiveRecord::Base
  
  validates :name, presence: true
  validates :mobile, presence: true, numericality: true
  validates :year, presence: true
  
  # q1 - Which company or organization would you kill to work for? Why?
end

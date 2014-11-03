class StudentAmbassador < ActiveRecord::Base
  
  # validates :name, presence: true
#   validates :mobile, presence: true, numericality: true
#   validates :year, presence: true
  
  # q1 - Which company or organization would you kill to work for? Why?
  
  def self.dedupe
    grouped = all.group_by(&:mobile)
    grouped.values.each do |sas|
      sas.shift
      
      sas.each { |sa| sa.destroy }
    end
  end
end

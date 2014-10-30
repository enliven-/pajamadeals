class Order < ActiveRecord::Base
  
  belongs_to :classified
  belongs_to :college
  belongs_to :buyer,   class_name: 'User'
  belongs_to :seller,  class_name: 'User'
  belongs_to :handler, class_name: 'User'
    
  enum status: { created: 0, in_process: 1, completed: 2, canceled: 3 }
end

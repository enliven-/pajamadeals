class Category < ActiveRecord::Base
  default_scope { where(active: true) }
  
  has_many :classifieds
end

class College < ActiveRecord::Base

	has_many :users
	has_many :classifieds
end

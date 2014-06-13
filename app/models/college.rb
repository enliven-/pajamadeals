class College < ActiveRecord::Base

	include HasToken

	has_many :users
	has_many :classifieds

	has_token
end

class User < ActiveRecord::Base

	include HasToken
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable

	has_many :classifieds

	belongs_to :college

	has_token	
end

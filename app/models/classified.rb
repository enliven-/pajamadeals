class Classified < ActiveRecord::Base

	BUY = 0
	SELL = 1

	include HasToken

	validates :title, presence: true, length: { maximum: 255 }
	validates :price, numericality: { greater_than_or_equal_to: 0.01,
				   	  allow_blank: true }
	validates :user_id, presence: true
	validates :college_id, presence: true

	belongs_to :user
	belongs_to :college

	before_create :set_college

	has_token
	mount_uploader :image, ImageUploader

	def buy?
		listing_type == BUY
	end

	def sell?
		!buy?
	end

	def unlist
		list = false
		save
	end

	private

	def set_college
		self.college = user.college
	end

end

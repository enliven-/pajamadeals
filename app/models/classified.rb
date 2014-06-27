class Classified < ActiveRecord::Base

	BUY = 0
	SELL = 1

	include HasToken

	# validates :title, presence: true, length: { maximum: 255 }
	# validates :expected_price, numericality: { greater_than_or_equal_to: 0.01,
	# 			   	  allow_blank: true }
	# validates :user_id, presence: true
	# validates :college_id, presence: true
	# validates :listing_type, presence: true

	has_many :images
	belongs_to :user
	belongs_to :college
	belongs_to :book

	before_create :set_college

	has_token

	mount_uploader :image, ImageUploader

	# search classified

	searchable do
		text :title, boost: 3.0
		text :description
		text :isbn

		time    :created_at
		string  :expected_price
		integer :listing_type
		integer :college_id
		boolean :list
	end

	def buy?
		listing_type == BUY
	end

	def sell?
		!buy?
	end

	def list

	end

	# calcs

	def percent_off
		if retail_price.present? && retail_price.to_i > expected_price.to_i
			((retail_price.to_i - expected_price.to_i) / retail_price.to_i) * 100
		end
	end

	private

	def set_college
		self.college_id || self.college = user.college
	end

end

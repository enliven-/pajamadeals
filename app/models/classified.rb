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
	has_many :picks
	belongs_to :user
	belongs_to :college
	belongs_to :book

	#after_touch :index
	before_create :set_college

	has_token

	scope :sold, -> { where(sold: true) }

	delegate :title, :description, :publisher, :author, :isbn, :edition,
		 :released_year, :retail_price, :university, :image, :pages,
		 to: :book
	# search classified
	searchable do
		# Searches on following fields
		text :title
		text :author
		text :isbn

		# Constrainsts
		time :created_at
		boolean :active
		boolean :sold
	end

	def buy?
		listing_type == BUY
	end

	def sell?
		!buy?
	end

	# calcs

	def percent_off
		if retail_price.present? && retail_price.to_f > expected_price.to_f
			(((retail_price.to_f - expected_price.to_f) / retail_price.to_f) * 100).round
		end
	end

	private

	def set_college
		self.college_id || self.college = user.college
	end
	
end

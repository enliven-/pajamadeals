class Classified < ActiveRecord::Base

	BUY = 0
	SELL = 1
	UNSOLD = 0
	SOLD = 1

	validates :title, present: true, length: { maximum: 255 }
	validates :price, numericality: { greater_than_or_equal_to: 0.01,
				   	  allow_blank: true }
	validates :user_id, present: true
	validates :college_id, present: true

	belongs_to :user
	belongs_to :college

	before_save :set_status, :set_college

	def buy?
		type == BUY
	end

	def sell?
		!buy?
	end

	def sold?
		status == SOLD
	end

	def unsold?
		!sold?
	end

	private

	def set_status
		status = UNSOLD
	end

	def set_college
		college_id = user.college_id
	end

end

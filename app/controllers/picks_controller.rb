class PicksController < ApplicationController
	def new
		@pick = Pick.new(params)
	end

	def create
		raise params.inspect
	end
end

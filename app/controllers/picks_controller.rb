class PicksController < ApplicationController

	before_action :authenitcate_user, only: [:new, :create]

	def new
		@pick = Pick.new
	end

	def create
		@pick = Pick.new(pick_params)
		@pick.user = current_user
		if @pick.save
			# some message
		else
			# errors
		end
	end

	private
	
	def pick_params
      params.require(:pick).permit(:message)
    end
end

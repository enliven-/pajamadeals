class OrdersController < ApplicationController
  
  before_action :set_classified, only: [:show]
  
  def create
    @order = Order.new(order_params)
    @order.buyer_id = current_user.id
    if @order.save
      redirect_to order_path(@order)
    else
      # some failure message
    end
  end
  
  def show
    
    render text: @order.to_json
  end
  
  # cancel order
  def delete
  end
  
  private
  
  def set_classified
    @order = Order.find(params[:id])
  end
  
  def order_params
    params.require(:order).permit(:classified_id, :seller_id, :college_id)
  end
end

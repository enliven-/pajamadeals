class OrdersController < ApplicationController
  
  def create
    @order = Order.new(order_params)
    @order.buyer = current_user
    if @order.save
      redirect_to order_path
    else
      # some failure message
    end
  end
  
  def show
  end
  
  # cancel order
  def delete
  end
  
  private
  
  def order_params
    params.require(:order).permit(:classified_id, :seller_id, :college_id)
  end
end

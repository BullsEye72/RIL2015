class OrderItemsController < ApplicationController
  
  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    redirect_to :back
  end
  
end
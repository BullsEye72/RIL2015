class ArticlesSuppliersController < ApplicationController
  
  def destroy
    @order_item = ArticlesSupplier.find(params[:id])
    @order_item.destroy
    redirect_to :back
  end
  
end
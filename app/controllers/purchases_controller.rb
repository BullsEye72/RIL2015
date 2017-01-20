class PurchasesController < ApplicationController

  def index
    @last_quotes = Quote.order(updated_at: :desc).first(10)
    @last_orders = Order.order(updated_at: :desc).first(10)
  end

end

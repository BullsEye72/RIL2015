class PurchasesController < ApplicationController

  layout 'application_with_menu'

  def index
    @last_quotes = Quote.order(updated_at: :desc).first(5)
    @last_orders = Order.order(updated_at: :desc).first(5)
  end

end

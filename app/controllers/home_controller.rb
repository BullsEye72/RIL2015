class HomeController < ApplicationController

  def index
    redirect_to commercials_url if current_user.has_role? :commercial
    redirect_to purchases_url if current_user.has_role? :purchaser
    redirect_to conceptions_url if current_user.has_role? :conceptor
  end
end

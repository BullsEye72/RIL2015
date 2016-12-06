class HomeController < ApplicationController

  def index
    redirect_to commercials_url if current_user.has_role? :commercial
  end
end

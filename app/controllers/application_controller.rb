class ApplicationController < ActionController::Base
  add_breadcrumb 'Accueil', :root_path
  layout 'application'

  protect_from_forgery
  before_action :authenticate_user_if_not_in_admin

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def authenticate_user_if_not_in_admin
    authenticate_user! unless self.class.parent == RailsAdmin
  end

end
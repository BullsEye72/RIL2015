class ApplicationController < ActionController::Base
  before_filter :set_current

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

  private

    def set_current
      User.current = current_user
    end

end
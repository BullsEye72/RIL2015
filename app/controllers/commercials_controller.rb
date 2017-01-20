class CommercialsController < ApplicationController
  #authorize_resource :class => false
  
  def index
    @last_quotes = Quote.order(updated_at: :desc).first(10)
    @last_projects = Project.order(updated_at: :desc).first(10)
  end
end
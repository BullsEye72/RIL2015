class CommercialsController < ApplicationController
  authorize_resource :class => false
  add_breadcrumb "Commercial", :commercials_path
  
  def index
    
    @param_page = {name: "page", value: params[:page]}
    @param_sort = {name: "sort", value: params[:sort]}
    
    case params[:sort]
    when '1'
      @projects = Project.joins(:customer).order('customers.lastname DESC').page @param_page[:value]
    when '2'
      @projects = Project.joins(:customer).order('customers.lastname ASC').page @param_page[:value]
    when '3'
      @projects = Project.order('id ASC').page @param_page[:value]
    when '4'
      @projects = Project.order('id DESC').page @param_page[:value]
    when '5'
      @projects = Project.order('updated_at DESC').page @param_page[:value]
    when '6'
      @projects = Project.order('updated_at ASC').page @param_page[:value]
    else
      @projects = Project.joins(:customer).order('customers.lastname DESC').page @param_page[:value]
    end
    
    
    
  end
  
  helper_method :get_params
  def get_params
      return "?#{@param_sort[:name]}=" if params[:page]==nil
      return "?#{@param_page[:name]}=#{@param_page[:value]}&#{@param_sort[:name]}=" if params[:page]!=nil
      return ''
  end

end
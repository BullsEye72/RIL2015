class CommercialsController < ApplicationController
  authorize_resource :class => false
  add_breadcrumb "Commercial", :commercials_path
  
  def index
    
    @param_page = {name: 'page', value: params[:page]}
    @param_sort = {name: 'sort', value: params[:sort]}
    
    @projects_menu = Project.order("updated_at DESC").first(5)
    
    order = (['nameAZ','id0N','dateNO'].include? params[:sort]) ? 'ASC' : 'DESC'
    
    case params[:sort]
    when 'nameAZ','nameZA'
      @projects = Project.joins(:customer).order("customers.lastname #{order}")
    when 'id0N','idN0'
      @projects = Project.order("id  #{order}")
    when 'dateON','dateNO'
      @projects = Project.order("updated_at #{order}")
    else
      @projects = Project.joins(:customer).order('customers.lastname ASC')
    end

    @projects = @projects.page @param_page[:value]
  end
end
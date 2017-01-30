class ProjectsController < ApplicationController
  before_action :set_customers, only: [:new, :create, :edit]
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  #authorize_resource :class => false
  add_breadcrumb "Projets" #, :projects_path
  
  # GET /projects/new
  def new
    add_breadcrumb "Nouveau"
    @project = Project.new
  end

  # POST /projects
  def create
    add_breadcrumb "Créer"
    
    @project = Project.new(project_params)
    if @project.save
      redirect_to commercials_path, notice: 'Le projet a bien été créé.'
      # redirect_to @project, notice: 'Le projet à bien été créé.'
    else
      render :new
    end
  end

  # GET /projects/
  def index
    #redirect_to commercials_path if current_user.has_role? :commercial
    
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
    
    if !params[:like].blank?
      @projects = Project.joins(:customer).where('firstname LIKE ? or lastname LIKE ?', '%'+params[:like]+'%','%'+params[:like]+'%')
    end
    @projects = @projects.page @param_page[:value]
  end

  

  # GET /project/:id
  def show
    add_breadcrumb "Projet"
  end

  # GET /project/:id/edit
  def edit
    add_breadcrumb "Edition"
  end

  # PATCH/PUT /project/:id/edit
  def update
      if @project.update(project_params)
          redirect_to @project,
                      notice: 'Le projet a bien été mis à jour'
      else
        render :edit
      end
  end

  # DELETE /project/:id
  def destroy
    @project.destroy
    redirect_to commercials_path
  end

  private

    def set_customers
      @customers = Customer.all.sort_by { |c| c.lastname}
    end

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:description, :customer_id )
    end


end

class ProjectsController < ApplicationController
  before_action :set_customers, only: [:new, :create]
  authorize_resource :class => false

  # GET /projects/new
  def new
    @project = Project.new

  end

  # POST /projects/new
  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to new_project_path, notice: 'Le projet à bien été créé.'
      # redirect_to @project, notice: 'Le projet à bien été créé.'
    else
      render :new
    end
  end

  private

    def set_customers
      @customers = Customer.all.sort_by { |c| c.lastname}
    end

    def project_params
      params.require(:project).permit(:description, :customer_id )
    end


end

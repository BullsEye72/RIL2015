class HouseModulesController < ApplicationController
  load_and_authorize_resource
  add_breadcrumb "Modules", :house_modules_path
  
  before_action :set_house_module, only: [:show, :edit, :update, :destroy]
@articles_new = Article.all.order("name")
  # GET /house_modules
  # GET /house_modules.json
  def index
    @house_modules = HouseModule.all.order("id DESC")
    
    #save for futur filter
    #@articles = @articles.where('name LIKE ?', '%'+params[:nom]+'%') if !params[:nom].blank?
    #@articles = @articles.where('reference LIKE ?', '%'+params[:ref]+'%') if !params[:ref].blank?
    
    @house_modules = @house_modules.page(params[:page])
    @articles_new = Article.all.order("name")
  end

  # GET /house_modules/1
  # GET /house_modules/1.json
  def show
    add_breadcrumb @house_module.name
    @articles_modules = @house_module.articles
  end

  # GET /house_modules/new
  def new
    @house_module = HouseModule.new
    @articles_module = @house_module.articles_modules.all
    
    add_breadcrumb "Nouveau module"
  end

  # GET /house_modules/1/edit
  def edit
    add_breadcrumb "Editer " + @house_module.name
    @articles_modules = @house_module.articles_modules.all
  end

  # POST /house_modules
  # POST /house_modules.json
  def create
    @house_module = HouseModule.new(house_module_params)
    #byebug
    respond_to do |format|
      if @house_module.save
        format.html { redirect_to @house_module, notice: 'House module was successfully created.' }
        format.json { render :show, status: :created, location: @house_module }
      else
        format.html { render :new }
        format.json { render json: @house_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /house_modules/1
  # PATCH/PUT /house_modules/1.json
  def update
    respond_to do |format|
      if @house_module.update(house_module_params)
        format.html { redirect_to @house_module, notice: 'House module was successfully updated.' }
        format.json { render :show, status: :ok, location: @house_module }
      else
        format.html { render :edit }
        format.json { render json: @house_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /house_modules/1
  # DELETE /house_modules/1.json
  def destroy
    @house_module.destroy
    respond_to do |format|
      format.html { redirect_to house_modules_url, notice: 'House module was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house_module
      @house_module = HouseModule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_module_params
      params.require(:house_module).permit(:range_id, :name, :default, :layout_id, :drawing_id, :description, :module_range_id)
    end
end
class ProductsController < ApplicationController
  load_and_authorize_resource
  add_breadcrumb "Produits", :products_path
  
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  @modules_new = HouseModule.all.order("name")
  # GET /products
  # GET /products.json
  def index
    @products = Product.all.order("id DESC")
    
    @products = @products.page(params[:page])
    @modules_new = HouseModule.all.order("name")
  end

  # GET /products/1
  # GET /products/1.json
  def show
    add_breadcrumb @product.name
    @modules_product = @product.modules_products.all
    @quotes = @product.quotes
  end

  # GET /products/new
  def new
    @model_product = Product.draft_or_default.where(id: params[:product_model_id]).first if params.key?(:product_model_id)
    @product = Product.new
      if @model_product
      @product.attributes= {
          name: @model_product.name ,
          descriptif: @model_product.descriptif,
          cctp_reference: @model_product.cctp_reference,
          drawing_id: @model_product.drawing_id,
      }
      #@modules_product = @model_product.modules_products.all
      @redirect_url = request.referer
      end
    add_breadcrumb "Nouveau produit"
  end

  # GET /products/1/edit
  def edit
    add_breadcrumb "Editer " + @product.name
    @modules_product = @product.modules_products.all
  end

  # POST /products
  # POST /products.json
  def create

    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html {
          redirect = @product
          if params.key?(:redirect) && params[:redirect].key?(:address)
            redirect = "#{params[:redirect][:address]}?select_product=#{@product.id}"
          end
          redirect_to redirect, notice: 'Product was successfully created.'
        }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.fetch(:product, {})
      params.require(:product).permit(:product_model_id,
                                      :name,
                                      :descriptif,
                                      :cctp_reference,
                                      :drawing_id,
                                      :product_state_id,
                                      :house_module_ids)


    end
end

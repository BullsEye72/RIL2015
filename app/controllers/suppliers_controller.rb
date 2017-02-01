class SuppliersController < ApplicationController
  
  add_breadcrumb "Fournisseur", :suppliers_path
  
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]

  # GET /suppliers
  # GET /suppliers.json
  def index
    @suppliers = Supplier.page(params[:page])
  end

  # GET /suppliers/1
  # GET /suppliers/1.json
  def show
    add_breadcrumb @supplier.name
    
    @articles=Supplier.find(@supplier.id).articles
  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
    add_breadcrumb "Nouveau Fournisseur"
  end

  # GET /suppliers/1/edit
  def edit
    add_breadcrumb "Editer " + @supplier.name
    
    @articles=Supplier.find(@supplier.id).articles
  end

  # POST /suppliers
  # POST /suppliers.json
  def create
    add_breadcrumb "Création fournisseur"
    
    @supplier = Supplier.new(supplier_params)

    respond_to do |format|
      if @supplier.save
        format.html { redirect_to @supplier, notice: 'Supplier was successfully created.' }
        format.json { render :show, status: :created, location: @supplier }
      else
        format.html { render :new }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suppliers/1
  # PATCH/PUT /suppliers/1.json
  def update
    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { redirect_to @supplier, notice: 'Supplier was successfully updated.' }
        format.json { render :show, status: :ok, location: @supplier }
      else
        format.html { render :edit }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers/1
  # DELETE /suppliers/1.json
  def destroy
    @supplier.destroy
    respond_to do |format|
      format.html { redirect_to suppliers_url, notice: 'Supplier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplier_params
      params.require(:supplier).permit(:name, :phone_number, :siret, :fax_number)
    end
end

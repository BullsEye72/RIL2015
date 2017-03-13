class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]

  # GET /order_items
  # GET /order_items.json
  def index
    @order_items = OrderItem.all
  end

  # GET /order_items/1
  # GET /order_items/1.json
  def show
  end

  # GET /order_items/new
  def new
    @order_item = OrderItem.new
    @order = Order.find(params[:order])
    if @order
      redirect_to :back if @order.effective?
      # @article_supplier = ArticlesSupplier.where(supplier: @order.supplier)
      @article_supplier = @order.supplier.articles_suppliers.all
    end
  end

  # GET /order_items/1/edit
  def edit
    redirect_to :back if @order_item.order.effective?
  end

  # POST /order_items
  # POST /order_items.json
  def create
    @order_item = OrderItem.new(order_item_params)
    respond_to do |format|
      if @order_item.save
        format.html { redirect_to :back, notice: 'Order item was successfully created.' }
        format.json { render :show, status: :created, location: @order_item }
      else
        format.html { render :new }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_items/1
  # PATCH/PUT /order_items/1.json
  def update
    redirect_to :back if @order_item.order.effective?
    respond_to do |format|
      if @order_item.update(order_item_params)
        format.html { redirect_to :back, notice: "L'élément de commande a été mis à jour" }
        format.json { render :show, status: :ok, location: @order_item }
      else
        format.html { render :edit }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1
  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy unless @order_item.order.effective?
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_item_params
      params.require(:order_item).permit(:quantity, :order_id, :articles_supplier_id)
    end
end

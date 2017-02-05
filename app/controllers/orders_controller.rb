class OrdersController < ApplicationController
  load_and_authorize_resource
  add_breadcrumb "Commandes", :orders_path
  
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.page(params[:page])
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    add_breadcrumb "Commande n°" + @order.id.to_s
    @order_items = OrderItem.where(order_id: @order)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'file_name',
               show_as_html: params.key?('debug'),
               footer: {
                   right: 'p [page]/[topage]',
                   left: Time.now.strftime('%d-%m-%Y')
               }
      end
    end
  end

  # GET /orders/new
  def new
    @order = Order.new
    add_breadcrumb "Nouvelle Commande"
  end

  # GET /orders/1/edit
  def edit
    @order_items = OrderItem.where(order_id: @order.id)
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'La commande a été créée avec succès.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'La commande a été créée avec succès.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_total_price ord_id
    begin
      c=0
      OrderItem.where(order_id: ord_id).each do |oi|
        c += oi.quantity * oi.articles_supplier.price
      end
      return view_context.number_to_currency(c, locale: :fr)
    rescue
      return "Erreur"
    end
  end
  
  def get_total_items ord_id
    "%g" % OrderItem.where(order_id: ord_id).sum(:quantity)
  end
  helper_method :get_total_price
  helper_method :get_total_items

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:total_due_calc, :supplier_id, :quote_id)
    end
end

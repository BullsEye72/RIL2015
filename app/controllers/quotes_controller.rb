class QuotesController < ApplicationController
  load_and_authorize_resource
  add_breadcrumb "Devis", :quotes_path

  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  # GET /quotes
  # GET /quotes.json
  def index
    @quotes = Quote.order('updated_at DESC')
    @quotes = @quotes.page(params[:page])
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
    add_breadcrumb "Devis n°" + @quote.id.to_s
    @product = @quote.product
    @modules = @product.house_modules
    respond_to do |format|
      format.html
      format.json
      format.pdf do
        if @quote.quote_states.last == QuoteState.find_by_name('brouillon')
          @quote.update(
              quote_states: @quote.quote_states<< QuoteState.find_by_name('en attente')
          )
        end
        render pdf: "commande_#{@quote.id}",
               show_as_html: params.key?('debug'),
               footer: {
                   right: 'p [page]/[topage]',
                   left: Time.now.strftime('%d-%m-%Y')
               }
      end
    end
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
    @default_products = Product.draft_or_default
    add_breadcrumb "Nouveau Devis"
  end

  # GET /quotes/1/edit
  def edit
    add_breadcrumb "Editer devis n°#{@quote.id}"
  end

  # POST /quotes
  # POST /quotes.json
  def create
    @quote = Quote.new(quote_params)

    respond_to do |format|
      if @quote.save
        format.html { redirect_to @quote, notice: 'Le devis a été créé avec succès.' }
        format.json { render :show, status: :created, location: @quote }
      else
        format.html { render :new }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotes/1
  # PATCH/PUT /quotes/1.json
  def update
    if params.key?(:status)
      @quote.quote_states << QuoteState.find_by_name('accepté') if params[:status][:accept]
      @quote.quote_states << QuoteState.find_by_name('refusé') if params[:status][:decline]
      redirect_to @quote, notice: "L'état du devis à été mis à jour"
      
      
      
      # GENERATION DE COMMANDES
      if params[:status][:accept]
        listSuppliers = Hash.new
        modules = @quote.product.house_modules
        
        modules.each do |m|
          m.articles.each do |a|
            
            art = ArticlesSupplier.where(article: a.id).order(:price).first
            listSuppliers[art.supplier] = [] if listSuppliers[art.supplier].nil?
            listSuppliers[art.supplier] << art
            
          end
        end
        
        listSuppliers.each do |supplier,artsup_array|
          q = Order.create!(supplier: supplier, quote: @quote, effective?: true)  
          
          artsup_array.each do |art_sup|
            OrderItem.create!(articles_supplier: art_sup,
                             order: q,
                              quantity: 1) # hmpf
          end
          
        end
                          
      end
        
    else
      respond_to do |format|
        if @quote.update(quote_params)
          format.html { redirect_to @quote, notice: 'Quote was successfully updated.' }
          format.json { render :show, status: :ok, location: @quote }
        else
          format.html { render :edit }
          format.json { render json: @quote.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to quotes_url, notice: 'Quote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_params
      params.require(:quote).permit(:project_id, :product_id, :quote_state_ids, :construction_state_ids)
    end
end

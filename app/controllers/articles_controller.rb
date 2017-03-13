class ArticlesController < ApplicationController
  load_and_authorize_resource
  add_breadcrumb "Articles", :articles_path

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index

    @articles =  Article.all
    @articles = @articles.where('name LIKE ?', '%'+params[:nom]+'%') if !params[:nom].blank?
    @articles = @articles.where('reference LIKE ?', '%'+params[:ref]+'%') if !params[:ref].blank?
    @articles = @articles.page(params[:page])

  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    add_breadcrumb @article.name
    @suppliers=Article.find(@article.id).suppliers
  end

  # GET /articles/new
  def new
    @article = Article.new
    @units = Unit.where(unit_category_id: 1 )
    add_breadcrumb "Nouvel Article"
  end

  # GET /articles/1/edit
  def edit
    add_breadcrumb "Editer " + @article.name
    @suppliers=Article.find(@article.id).suppliers
    @article_unit = @article.articles_units.first
    @unit = @article_unit.unit
    @units = Unit.where(unit_category: @unit.unit_category )

  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        @article_unit = ArticlesUnit.create(article: @article,
                                            unit_id: params[:articles_units][:unit_id],
                                            value: params[:articles_units][:value])
        format.html { redirect_to @article, notice: "L'Article a été créé avec succès." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        @article.articles_units.last.update(unit_id: params[:articles_units][:unit_id],
                                       value: params[:articles_units][:value])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:name,
                                      :article_group_id,
                                      :value_added_tax_id,
                                      :reference,
                                      :description #,
                                      #articles_units_attributes: [:unit_id, :value]
      )

    end
end
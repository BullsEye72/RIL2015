class ArticlesController < ApplicationController
    
  layout 'application_with_menu'
  add_breadcrumb "Articles", :articles_path
  
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  
  # GET /articles
  # GET /articles.json
  def index
    @articles =  Article.page(params[:page]).per(15)
    add_breadcrumb "Accueil"
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    
    add_breadcrumb @article.name
    
    @suppliers=[]
    @article_suppliers=ArticleSupplier.joins(:supplier, :article).where(article_id: @article.id)
    
  end

  # GET /articles/new
  def new
    @article = Article.new
    add_breadcrumb "Nouvel Article"
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
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
      params.require(:article).permit(:name, :article_group_id, :value_added_tax_id, :reference, :description)
    end
end

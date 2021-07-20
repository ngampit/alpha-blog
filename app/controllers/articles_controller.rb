class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  
  def index
    @articles = Article.all
  end

  
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  
  def edit
    @article = Article.find(params[:id])
  end


  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to @article
    else 
      render 'new'
    end
  end

  
  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))    
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end


  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :description)
    end
end

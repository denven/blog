class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new   # why should I add this line?
  end
  
  def create
    @article = Article.new(article_params)
   
    if @article.save
      redirect_to @article
    elsif
      redirect_to 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
   
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end

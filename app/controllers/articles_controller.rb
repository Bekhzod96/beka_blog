class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end
 
  def new
    @article = Article.new
  end

  def edit
    
  end
  def create
    #debugger
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:success] = "Article was successfully Created!"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    
    
  end

  def destroy
    
    @article.destroy
    flash[:danger] = 'Articles successfully Deleted!'
    redirect_to articles_path
  end

  def update
    
    if @article.update(article_params)
      flash[:success] = "Article was updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end


  private 
  def set_article
    @article = Article.find(params[:id])
  end
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
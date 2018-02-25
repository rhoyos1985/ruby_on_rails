class ArticlesController < ApplicationController
   before_action :set_article, only: [:edit, :update, :show, :destroy]
 
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first

    if @article.save
      flash[:success] = "Object successfully created"
      redirect_to @article
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
	
  def destroy
    @article.destroy ? flash[:success] = 'Object was successfully deleted.' : flash[:error] = 'Something went wrong'
    redirect_to articles_path
  end
	
  def edit

  end

  def index
    @articles = Article.all
  end
	
  def show
			
  end

  def update
    if @article.update_attributes(article_params)
      flash[:success] = "Article was successfully updated"
      redirect_to @article
    else
      flash[:error] = "Something went wrong"
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

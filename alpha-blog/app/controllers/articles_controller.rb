class ArticlesController < ApplicationController
  before_action :set_article, only: %i[edit update show destroy]
  before_action :require_user, except: %i[index show]
  before_action :require_same_user, only: %i[edit update destroy]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      flash[:success] = 'Object successfully created'
      redirect_to @article
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def destroy
    @article.destroy ? flash[:success] = 'Object was successfully deleted.' : flash[:error] = 'Something went wrong'
    redirect_to articles_path
  end

  def edit; end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def show; end

  def update
    if @article.update_attributes(article_params)
      flash[:success] = 'Article was successfully updated'
      redirect_to @article
    else
      flash[:error] = 'Something went wrong'
      render 'edit'
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def require_same_user
    if (current_user != @article.user) && !current_user.admin?
      flash[:error] = 'You can only edit or delete your own articles'
      redirect_to root_path
    end
  end
end

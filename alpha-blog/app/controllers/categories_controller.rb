class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]
  before_action :require_admin, except: %i[index show]

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Category successfully created'
      redirect_to categories_path
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def new
    @category = Category.new
  end

  def show; end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def require_admin
    if !logged_in? || (logged_in? && !current_user.admin?)
      flash[:error] = 'Only admins can perform that action'
      redirect_to categories_path
    end
  end
end

class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

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
    @categories = Category.all
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
end

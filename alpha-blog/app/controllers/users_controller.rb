class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :require_same_user, only: %i[edit update destroy]
  before_action :require_admin, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the Alpha Blog #{@user.username}"
      redirect_to user_path(@user)
    else
      flash[:error] = "The user hasn't be created"
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User and all articles created by user have been deleted"
    redirect_to users_path
  end

  def edit; end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'Your account was updated successfully'
      redirect_to articles_path
    else
      flash[:error] = 'Your account was not updated'
      render 'edit'
    end
  end

  def show
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.required(:user).permit(:username, :email, :password)
  end

  def require_same_user
    if current_user != @user and !current_user.admin?
      flash[:error] = 'You can only edit your own account'
      redirect_to root_path
    end
  end

  def require_admin
    if logged_in? and !current_user.admin?
      flash[:error] = "Only admin users can perform that action"
      redirec_to root_path
    end
  end
end

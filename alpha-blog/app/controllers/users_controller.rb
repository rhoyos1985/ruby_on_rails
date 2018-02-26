class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Alpha Blog #{@user.username}"
      redirect_to articles_path
    else
      flash[:error] = "The user hasn't be created"
      render 'new'
    end
  end

  private
    def user_params
      params.required(:user).permit(:username, :email, :password)
    end

end

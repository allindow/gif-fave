class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def show
    if current_user
      @user = current_user
    else
      render file: '/public/404'
    end
  end

end

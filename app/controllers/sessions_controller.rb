class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:sessions][:username])
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in succesfully!"
      route_welcome_page(user)
    else
      flash.now[:error] = "Invalid username or password"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

private
  def route_welcome_page(user)
    redirect_to admin_welcome_index_path if user.admin?
    redirect_to user_path(user) if user.default?
  end
end

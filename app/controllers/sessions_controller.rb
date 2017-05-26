class SessionsController < ApplicationController

  def index
    redirect_to login_path
  end

  def new
    @user = User.new
  end

  def create
    if User.find_by_name(params[:username]) == nil
      user = User.new(user_params)
      user.save
      session[:user_id] = user.id
      redirect_to guests_path
    elsif User.find_by_name(params[:username])
      user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to guests_path
      render :new
    end
  end

private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end

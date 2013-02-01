class LoginController < ApplicationController

  def index
    redirect_to new_login_path
  end

  def new
  end

  def create
    if @user = User.find_by_username(params[:user][:username])
      if @user.authenticate(params[:user][:password])
        # token =
        session[:user_id] = @user.id
        flash[:notice] = "Welcome to the Secret Share App, #{@user.username}! Your token is #{session[:user_id]}"
        redirect_to @user
      else
        flash[:notice] = "Woah, guy, try again!"
        flash[:error] = "Wrong Password"
        render :new
      end
    else
      flash[:notice] = "Woah, guy, try again!"
      flash[:error] = "Invalid username"
      render :new
    end
  end

end

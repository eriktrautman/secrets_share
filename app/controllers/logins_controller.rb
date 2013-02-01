class LoginsController < ApplicationController
  skip_before_filter :require_login, only: [:new, :create]

  def index
    redirect_to new_login_path
  end

  def new
  end

  def create
    if @current_user = User.find_by_username(params[:username])
      if @current_user.authenticate(params[:password])
        if token = @current_user.reset_token
          session[:token] = token
          flash[:notice] = "You are logged in!"
          redirect_to user_path(@current_user)
        else
          flash[:notice] = "AAAAAAH PANIC"
          flash[:error] = @current_user.errors.full_messages.to_sentence
          render :new
        end
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


  def destroy
    @current_user.delete_token
    session[:token] = nil
    flash[:notice] = "You've successfully logged out."
    @current_user = nil
    render :new
  end

end

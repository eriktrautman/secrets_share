class UsersController < ApplicationController

  skip_before_filter :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Welcome to the Secret Share App, #{@user.username}!"
      @current_user = @user
      token = @current_user.reset_token
      session[:token] = token
      redirect_to @user
    else
      flash[:notice] = "Woah, guy, try again!"
      flash[:error] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end

class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Welcome to the Secret Share App, #{@user.username}!"
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

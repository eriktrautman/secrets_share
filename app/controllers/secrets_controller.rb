class SecretsController < ApplicationController


  def new
    @secret = Secret.new
  end

  def create
    @secret = Secret.new(params[:secret])
    @secret.user = @current_user
    if @secret.save
      flash[:notice] = "Thanks for sharing!"
      redirect_to @current_user
    else
      flash[:notice] = "Woah, guy, try again!"
      flash[:error] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

end

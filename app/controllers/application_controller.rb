class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login

  private

  def require_login
    unless logged_in?
      flash[:error] = "YOU NEED TO LOG IN"
      redirect_to new_login_path
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    unless session[:token].nil?
      @current_user = User.find_by_session_token(session[:token])
    else
      nil
    end

  end


end

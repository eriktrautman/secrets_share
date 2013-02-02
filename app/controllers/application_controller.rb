class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login
  before_filter :check_access

  private

  def check_access
    unless has_access?
      flash[:error] = "You do not have access to that page"
      puts "AM I HERE???"
      redirect_to @current_user
    end
  end

  def has_access?
    if !@current_user.nil?
      if params[:id]
        puts "I am also here with params Id of #{params.inspect} and current id of #{@current_user.id}"
        @current_user.id == params[:id].to_i
      else
        true
      end
    else
      true
    end
  end

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

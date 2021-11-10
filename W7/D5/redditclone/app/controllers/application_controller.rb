class ApplicationController < ActionController::Base
  helper_method :current_user 

  def current_user
    return nil unless session[:session_token] 
    @current_user ||= user.find_by(session_token: session[:session_token])
  end 

  def require_signed_in!
    redirect_to new_session_url unless logged_in?
  end 

  def log_in_user!(user)
    session[:session_token] = user.reset_session_token! 
  end

  def log_out_user!
    current_user.reset_session_token! 
    session[:session_token] = nil 
    
  end 

  def logged_in?
    !!current_user 
  end

end

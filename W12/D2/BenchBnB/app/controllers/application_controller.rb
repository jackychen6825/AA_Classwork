class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def login!(user)
        session[:session_token] = user.session_token
    end

    def logout!
        current_user.reset_session_token!
        session[:session_token] = nil
    end

    def current_user
        return nil unless session[:session_token] 
        @current_user ||= User.find_by_session_token(session[:session_token])
    end

    def logged_in?
        !!current_user
    end

    def require_logged_out
        redirect_to  api_user_url unless logged_in?
    end
end

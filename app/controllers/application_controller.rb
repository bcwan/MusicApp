class ApplicationController < ActionController::Base
    def current_user
        return nil unless session[:session_token]
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    #if current_user has no instance of user, then we are not logged in
    def logged_in?
        !current_user.nil?
    end

    #reset the user's session token and cookie
    def login_user!(user)
        session[:session_token] = user.reset_session_token!
    end

    def logout_user!
        current_user.reset_session_token!
        session[:session_token] = nil
    end
end

class SessionsController < ApplicationController
    #login
    def create
        #find if the user exists
        user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        #if no user exists, throw an error during the response
        if user.nil?
            flash.now[:errors] = ["Incorrect email/password combo"]
            render :new
        else  
            login_user!(user)
            redirect_to user_url(params[:user][:id])
        end

    end

    #logout, and go back to login screen
    def destroy
        logout_user!
        redirect_to new_session_url
    end

    def new
        render :new
    end
end

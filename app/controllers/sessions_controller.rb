class SessionsController < ApplicationController
    def create
        user = User.find_by_credentials(params[:user][:email], params[:user][:password])

        if user.nil?
            flash.now[:errors] = ["Incorrect email/password combo"]
            render :new
        else  
            login_user!(user)
            redirect_to user_url
        end

    end

    


end

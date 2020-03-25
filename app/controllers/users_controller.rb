class UsersController < ApplicationController
    
    def create
        @user = User.new(user_params)
        if @user.save
            #logs in user upon creation
            login_user!(@user)
            redirect_to 

    end

    def new

    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end

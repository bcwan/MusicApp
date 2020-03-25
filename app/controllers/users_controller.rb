class UsersController < ApplicationController
    
    def create

    end

    def new

    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end

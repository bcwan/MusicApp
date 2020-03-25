class UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id])
        render :show
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            #logs in user upon creation
            login_user!(@user)
            #go to their page
            redirect_to user_url(params[:id])
        else
            #show error during response cycle
            flash.new[:errors] = @user.errors.full_messages
            #go back to sign up page
            render :new
        end
    end

    def new
        @user = User.new
        render :new
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end

end

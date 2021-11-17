class Api::UsersController < ApplicationController
    def new
        render :new 
    end

    def create
        @user = User.new(user_params)
        if @user.save 
            login!(@user)
        else 
            flash.now[:errors] = @user.errors 
            render :new 
        end 
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
end

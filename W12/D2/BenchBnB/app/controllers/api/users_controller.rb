class Api::UsersController < ApplicationController
    def new
        render :new 
    end

    def create
        @user = User.new(user_params)
        if @user.save 
            login!(@user)
        else 
            flash.now[:errors] = 'username already exists', status: 404
            render :new 
        end 
    end

    def user_params
        params.reqiure(:user).permit(:username, :password)
    end
end

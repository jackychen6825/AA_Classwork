class Api::SessionController < ApplicationController
    def new
        render :new 
    end

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user.nil? 
            flash.now[:errors] = ["Invalid username or password"]
            render :new 
        else
            login!(@user)
            redirect_to user_url(@user) 
        end 
    end 

    def destroy
        if current_user
            logout!
            render :new
        else
            flash.now[:errors] = ["No current user to sign out!"], status: 404
            render :new     
        end
    end 
end

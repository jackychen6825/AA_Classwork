class SessionsController < ApplicationController
  def new
    # render :new -> should be implicit so i aint writing it out
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username], 
      params[:user][:password]
    ) #verifying user 
    
    if user #if user exist - truthy 
      login_user(user) #changing session token / updating session[:session_token] w new token 
      redirect_to cats_url 
    else
      flash.now[:errors] = ["Incorrect username and/or password"]
      render :new #show new session form 
    end 
  end

  def destroy
    if current_user
      @current_user.reset_session_token!
      session[:session_token] = ""
    end
  end

end

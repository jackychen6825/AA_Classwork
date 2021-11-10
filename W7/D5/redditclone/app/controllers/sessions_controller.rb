class SessionsController < ApplicationController
  before_action :require_signed_in!, only: [:destroy] 

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.erros.full_messages
      render :new
    end
  end

  def destroy
    log_out_user! 
    redirect_to new_session_url
  end
end

class UsersController < ApplicationController

  #before_action :require_signed_in!, only: [:show, :index] 

  def new
    @user = User.new
    render :new 
  end

  def create
    @user = User.new(user_param)
    if @user.save
      log_in_user!(@user)
      redirect_to subs_url # 
    else 
      flash[:errors] = @user.errors.full_message
      render :new 
    end 
  end

  def show
    @user = User.find(params[:id])
    render :show 
  end

  def index
    @users = User.all 
    render :index 
  end

  def user_params
    params.require(:user).permit(:username, :password) 
  end 
end

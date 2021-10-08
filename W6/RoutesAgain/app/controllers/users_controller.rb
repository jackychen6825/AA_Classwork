class UsersController < ApplicationController

  def index 
    # render plain: "I'm in the index action!" 
    users = User.all 
    render json: users
  end

  def show 
    user = User.find(params[:id])
    render json: user
  end
  
  def create
    user = User.new(user_params)
    # user = User.new(username: params[:username])
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: users.errors.full_messages, status: 422
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user
  end

  def user_params 
    params.require(:user).permit(:username) #strong param 
  end 

end 
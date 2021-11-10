class UsersController < ApplicationController
  # before_action :require_logged_in 

  def new
    #implicit render :new 
  end

  def create
    @user = User.new(user_params) #create new instance of user and set it to instance var
    
    if @user.save 
      login_user(@user) #did our method come w a bang?
      redirect_to cats_url #after user has signed up - redirect to the cats index pg - showing all cats 
    else
      flash.now[:errors] = @user.errors.full_messages #i presume this temp. shows the user the errors associated w making the new user
      render :new #-> send to new form pg. 
    end
    
  end
  
  private #can only be called implicitly on self 
  def user_params
    params.require(:user).permit(:user_name, :password) #user needs to pass in username . password to proceed 
  end


end

class CommentsController < ApplicationController

  def index
    if params[:user_id] #is not nil 
      user = User.find(params[:user_id]) 
      comments = user.comments
      render json: comments #arr of all comments instance from this user 
      # Comment.find(params[:commenter_id])
    else 
      artwork = Artwork.find(params[:artwork_id])
      comments = artwork.comments  
      render json: comments
    end 
  end 

end 
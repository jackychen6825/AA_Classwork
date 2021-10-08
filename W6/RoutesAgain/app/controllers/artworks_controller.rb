class ArtworksController < ApplicationController
  def index #user_id 
    # render plain: "I'm in the index action!" 
    # if params[:user_id]

    # end 

    user = User.find(params[:user_id])
    # user.

    artworks = user.artworks + user.shared_artworks 
    render json: artworks
  end 

  def show 
    artwork = Artwork.find(params[:id])
    render json: artwork
  end
  
  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.update(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy
    render json: artwork
  end

  def artwork_params 
    params.require(:artwork).permit(:title, :image_url, :artist_id) #strong param 
  end 
end
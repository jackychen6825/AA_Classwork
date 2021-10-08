class ArtworkSharesController < ApplicationController

  def create
    artwork_share = ArtworkShare.new(artwork_shares_params)
    # artwork_share = artwork_share.new(artworkname: params[:artworkname])
    if artwork_share.save
      render json: artwork_share
    else
      render json: artwork_share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy 
    artwork_share = ArtworkShare.find(params[:id])
    artwork_share.destroy
    render json: artwork_share
  end 

  def artwork_shares_params  
    params.require(:artwork_shares).permit(:artwork_id, :viewer_id) #strong param 
  end 


end 
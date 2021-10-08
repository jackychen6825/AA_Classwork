class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true 
  
  has_many :artworks, # created 
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :Artwork
  
  has_many :viewed_art, #all the artwork that has been shared to a user - artwork_id 
    primary_key: :id, 
    foreign_key: :viewer_id,
    class_name: :ArtworkShare

  #users join artwork_share on user.id = artwork_share.viewer_id 

  has_many :shared_artworks, #
    through: :viewed_art, #grab all the artwork_ids that have been shared to this user instance 
    source: :artwork #grabs all the artworks based on the artwork_id 

  has_many :comments, dependent: :destroy,
    primary_key: :id,
    foreign_key: :commenter_id,
    class_name: :Comment
end
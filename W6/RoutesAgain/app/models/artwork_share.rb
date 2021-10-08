class ArtworkShare < ApplicationRecord
  validates :artwork_id, uniqueness: {scope: :viewer_id} 

  #associations 
  belongs_to :artwork, #artworks 
    primary_key: :id, 
    foreign_key: :artwork_id,
    class_name: :Artwork

  belongs_to :viewer, #users 
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :User 
    
end 
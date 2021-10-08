class Artwork < ApplicationRecord
  validates :artist_id, uniqueness: {scope: :title} 

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

  has_many :views,
    primary_key: :id, 
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

  has_many :shared_viewers, 
    through: :views, 
    source: :viewer 

  has_many :comments, dependent: :destroy, # 
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Comment 

end
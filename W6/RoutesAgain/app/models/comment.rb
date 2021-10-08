class Comment < ApplicationRecord
  validates :commenter_id, presence: true
  validates :artwork_id, presence: true
  
  belongs_to :author,
    primary_key: :id,
    foreign_key: :commenter_id,
    class_name: :User

  belongs_to :artwork, 
    primary_key: :id, 
    foreign_key: :artwork_id,
    class_name: :Artwork
  
end
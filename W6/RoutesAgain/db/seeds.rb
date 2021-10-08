# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do #ids be crazy 
  ArtworkShare.delete_all
  Artwork.delete_all
  User.delete_all 

  user1 = User.create(username: "Paulo")
  user2 = User.create(username: "Jack") 
  user3 = User.create(username: "Ayce")

  artwork1 = Artwork.create(title: "Mona Lisa", image_url: ".", artist_id: user1.id)
  artwork2 = Artwork.create(title: "Starry Night", image_url: ".", artist_id: user2.id)
  artwork3 = Artwork.create(title: "Self Portrait", image_url: ".", artist_id: user3.id)

  share1 = ArtworkShare.create(artwork_id: artwork1.id, viewer_id: user2.id)
  share2 = ArtworkShare.create(artwork_id: artwork1.id, viewer_id: user3.id)
  share3 = ArtworkShare.create(artwork_id: artwork2.id, viewer_id: user1.id)
  share4 = ArtworkShare.create(artwork_id: artwork2.id, viewer_id: user3.id)
  share5 = ArtworkShare.create(artwork_id: artwork3.id, viewer_id: user1.id)
  share6 = ArtworkShare.create(artwork_id: artwork3.id, viewer_id: user2.id)
end 
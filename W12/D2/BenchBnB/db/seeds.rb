# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

guest1 = User.create!(
  username: 'Guest1',
  password: 'starwars1'
)

guest2 = User.create!(
  username: 'Guest2',
  password: 'starwars2'
)

guest3 = User.create!(
  username: 'Guest3',
  password: 'starwars3'
)



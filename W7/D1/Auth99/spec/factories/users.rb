FactoryBot.define do #creating factory bot

  factory :user do #specifically creating user bot
    username { Faker::Movies::HarryPotter.character } #assigns username 2 random hp char
    email { 'Faker::Internet.email' } #can call faker inside a string 
    password { 'password'}
    age { 20 } 
  end 

end 


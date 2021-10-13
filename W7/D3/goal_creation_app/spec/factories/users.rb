FactoryBot.define do
  factory :user do
    username { Faker::Movies::HarryPotter.character }
    password { "password" }
    
  end
end

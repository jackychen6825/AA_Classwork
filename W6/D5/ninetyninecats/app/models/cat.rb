class Cat < ApplicationRecord

  validates :color, :sex, :name, :birth_date, presence: true 

  def age 
    
  end

end

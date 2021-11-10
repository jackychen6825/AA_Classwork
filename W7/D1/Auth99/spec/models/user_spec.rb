require 'rails_helper'

RSpec.describe User, type: :model do 
  it { should validate_presence of (:username) }
  it { should validate_presence of (:password_digest) }
  it { should validate_presence of (:session_token) }
  it { should validate_length of (:password).is_at_least(6) }
  
  
  #tests that need us to create user object: user factory bot instead boi 
  # subject(:Toby) { User.create(username: 'Toby', email: 'Toby@aa.com' age: 5, password: 'password') }
  
  
  describe "uniqueness" do 
    before :each do 
      create(:user)
    end 
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:session_token) }
  end 

  
  
  describe 'is_valid_password?' do 
    #let: create a local instance variable 
    let!(:user) { create(:user) }
    
    context "with a valid password" do 
      #
      it "should return true" do 
        expect(user.is_valid_password?('password')).to be true 

      end
    end
    
    context "with an invalid password" do 
      it "should return true" do 
        expect(user.is_valid_password?('password1')).to be false 
      end
    end 
  end 
end 
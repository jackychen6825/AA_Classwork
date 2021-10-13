require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }

  it { should validate_length_of(:password).is_at_least(6) }

  describe "is_valid_password?" do 
    let!(:user) { create(:user) }
    context "with a valid password" do 
      it "should return true" do 
        expect(user.is_valid_password?('password')).to be true 
      end 
    end 
    context "with an invalid password" do 
      it "should return false" do 
        expect(user.is_valid_password?('peanuts')).to be false   
      end 
    end 
  end 
  
  describe "User::find_by_credentials" do 
    let!(:user) { create(:user) } #random hp char w pass of password 
    
  end 

end

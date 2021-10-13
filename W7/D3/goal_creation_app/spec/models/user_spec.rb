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
    FactoryBot.create(:user, username: 'Hermione Granger')

    user = User.find_by_credentials('Hermione Granger', 'password')
    it "should find the right user" do
      expect(User.last.id).to eq(user.id)
    end
  end 

  describe "password=" do
    let!(:user) { create(:user) }

    it "should set password to password argument" do
      expect(user.password).to eq("password")
    end

    it "should make password_digest with BCrypt" do 
      expect(BCrypt::Password).to receive(:create).with('password')
    end

  end

end

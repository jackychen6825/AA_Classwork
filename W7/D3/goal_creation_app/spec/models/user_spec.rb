require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }

  it { should validate_length_of(:password).is_at_least(6) }

  describe "is_valid_password?" do 
    let!(:user) { FactoryBot.create(:user) }

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
    user_create = FactoryBot.create(:user, username: 'Hermione Granger')

    user_find = User.find_by_credentials('Hermione Granger', 'password')
    it "should find the right user" do
      expect(user_create.username).to eq(user_find.username)
      # expect(user_create.password).to eq(user_find.password)
    end
  end 

  describe "#password=" do
    let!(:user) { FactoryBot.create(:user) }

    it "should set password to password argument" do
      expect(user.password).to eq("password")
    end

    it "should make password_digest with BCrypt" do 
      expect(BCrypt::Password).to receive(:create).with('password')
      FactoryBot.build(:user, password: 'password')
    end
  end

  describe "ensure_session_token" do 
    user1 = FactoryBot.create(:user, session_token: '123456')
    user2 = FactoryBot.create(:user, session_token: 'abc')
    
    it "should return the user's current session token" do 
      expect(user1.session_token).to eq('123456')
    end 

    it "should generate a new session token if session token is nil" do 
      user2.reset_session_token
      # expect(SecureRandom).to receive(:urlsafe_base64) 
      expect(user2.session_token).to_not eq('abc') 
      FactoryBot.build(:user)
    end 
  end 

  describe "reset_session_token" do 
    let!(:user) { FactoryBot.create(:user) } 

    it "should generate a new session token if session token is nil" do 
      expect(SecureRandom).to receive(:urlsafe_base64) 
      expect(user.session_token).to_not eq(nil) 
      FactoryBot.build(:user)
    end 

    it "should return the user's session token" do  
      expect(user.reset_session_token).to eq(user.session_token)
    end 

  end 
end

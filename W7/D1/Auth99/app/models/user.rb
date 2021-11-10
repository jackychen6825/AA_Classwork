# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  password_digest :string           not null
#  user_name       :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  attr_reader :password
  after_initialize :ensure_session_token 

  validates :user_name, :password_digest, presence: true
  validates :session_token, :user_name, uniqueness: true

  has_many :cats,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Cat
  
  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16) 
    self.save!
    self.session_token
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password) #set password digest to a hashed password through BCrypt 
  end

  def is_password?(password)
    password_object = BCrypt::Password.new(self.password_digest) #turn our password digest into a bcrypt object -> compare w the hashed argument 
    password_object.is_password?(password)
  end 

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    if user && user.is_valid_password?(password)
      return user 
    else
      return nil 
    end
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.base64(16)
  end
  
end

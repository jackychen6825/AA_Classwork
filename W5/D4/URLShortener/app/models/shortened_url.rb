require 'securerandom'

class ShortenedUrl < ApplicationRecord
  validates :long_url, :short_url,  presence: true
  validates :long_url, :short_url,  uniqueness: true

  def self.random_code #gen rand data --> short url 
    short_url = SecureRandom.urlsafe_base64
    until !exists?(short_url: short_url) 
      short_url = SecureRandom.urlsafe_base64
    end 
    short_url
  end

  def self.from_long_url_and_user
    
  end 

  #Person.exists?(:name => "David")
end

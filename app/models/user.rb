class User < ActiveRecord::Base
  has_many :topics
  has_many :posts
  has_many :attachments

  has_secure_password validations: false
end
class User < ActiveRecord::Base
  has_secure_password validations: false

  has_many :topics
  has_many :posts
  has_many :attachments
end

class User < ActiveRecord::Base
  has_many :topics
  has_many :posts
  has_many :attachments
  has_many :user_roles
  has_many :roles, through: :user_roles

  has_secure_password validations: false
  
  serialize :acl_cache

  def keycard
    @keycard ||= Keycard.new(self)
  end
end
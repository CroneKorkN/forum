class User < ActiveRecord::Base
  has_many :topics
  has_many :posts
  has_many :attachments
  has_many :user_roles
  has_many :roles, through: :user_roles

  has_secure_password validations: false
  
  serialize :acl_cache
  
  def acl
    @acl ||= ACL.new(self)
  end
  
  def categories
    Category.where("id IN(?)", acl.visible)
  end
  
private
  
  
end
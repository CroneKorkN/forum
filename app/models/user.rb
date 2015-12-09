class User < ActiveRecord::Base
  has_many :topics
  has_many :posts
  has_many :attachments
  has_many :user_roles
  has_many :roles, through: :user_roles

  has_secure_password validations: false
  
  serialize :acl_cache

  def authorized? action, object
    type = object.class.name.downcase
    id = object.id
    if acl[type] and acl[type][id] and acl[type][id][action]
      true
    else
      false
    end
  end
  
  #private

  # contains hash with actual rights for all categories
  def acl
    update(acl_cache: build_acl) if acl_cache.length < 1
    acl_cache
  end
  
  #User.first.rebuild_acl_cache
  def build_acl
    acl = {}
    acl[:category] = {}
    Category.all.each do |category|
      puts 1
      user_roles.where(category_id: category.id).each do |user_role|
        acl[:category][category.id] = [] if not acl[:category][category.id]
        puts 2
        user_role.role.permissions.each do |permission|
          puts 3
          acl[:category][category.id].push permission.action
        end
      end
    end
    acl
  end
end
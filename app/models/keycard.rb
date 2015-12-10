class Keycard
  def initialize(user)
    @acl = user.acl_cache || build_acl(user)
  end
  
  def authorizes?(action, object)
    type = object.class.name.downcase.to_sym
    id = object.id
    action = action.to_sym
    if @acl[type] and @acl[type][id] and @acl[type][id].include?(action)
      true
    else
      false
    end
  end
    
  def list(action, object)
    
  end

  private
  
  def build_acl(user)
    acl = {}
    acl[:category] = {}
    Category.all.each do |category|
      puts 1
      user.user_roles.where(category_id: category.id).each do |user_role|
        acl[:category][category.id] = [] if not acl[:category][category.id]
        puts 2
        user_role.role.permissions.each do |permission|
          puts 3
          acl[:category][category.id].push permission.action.to_sym
        end
      end
    end
    user.update acl_cache: acl
    acl
  end

end
class ACL # Access Controll List
  def initialize(user)
    @acl = user.acl_cache || build_acl(user)
  end
  
  def allows(action, object)
    unless object.nil?
      type = object.class.name.downcase.to_sym
      id = object.id
      action = action.to_sym
      if @acl[type] and @acl[type][id] and @acl[type][id].include?(action)
        true
      end
    else
      if @acl[:global] and @acl[:global][action]
        true
      end
    end
  end
    
  def visible_categories
    @acl[:visible]
  end

private

  {
    category: {
      "1": ["read"]
      
    },
    visible: [1, 5, 6, 8]
  }
  
  def build_acl(user)
    acl = {
      global: [],
      category: {},
      visible: []
    }
    Category.all.each do |category|
      puts 1
      user.user_roles.where(category_id: category.id).each do |user_role|
        acl[:category][category.id] = [] if not acl[:category][category.id]
        puts 2
        user_role.role.permissions.each do |permission|
          puts 3
          acl[:category][category.id] << permission.action.to_sym
          acl[:visible] << category.id
        end
      end
    end
    acl[:visible].uniq!
    user.update acl_cache: acl
    acl
  end

end
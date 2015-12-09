class ACL
  def initialize user
    @acl = {}
    
    @acl[:category] = {}
    Category.all.each do |category|
      puts 1
      user.user_roles.where(category_id: category.id).each do |user_role|
        @acl[:category][category.id] = [] if not acl[:category][category.id]
        puts 2
        user_role.role.permissions.each do |permission|
          puts 3
          @acl[:category][category.id].push permission.action
        end
      end
    end
    
    self
  end
  
  def hash
    @acl
  end
  
  private
  
  def add type, id, action
  end
end
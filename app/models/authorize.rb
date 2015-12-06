class Access
  def self.current_user=(user)
    @@current_user = user
  end
  
  def self.granted?(action, controller, user=@@current_user)
    true
  end
end
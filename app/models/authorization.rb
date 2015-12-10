class Authorization
  def initialize(user, action, object)
    raise Exceptions::AuthorizationError unless user.acl.allows action, object
  end
end
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout proc{|c| c.request.xhr? ? false : "application" }
  #before_action :authenticate!, except: [:new]
  helper_method :current_user, :authorize
  before_action :require_login

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  # first arg: ommit or user; second arg: `action: object`
  def authorize(*args)
    user, action, object = authorization_arguments(args)
    Authorization.new user, action, object
  end
  
  def authenticate!
    redirect_to ""
  end
  
private
  
  def require_login
    redirect_to login_url unless current_user
  end
  
  def authorization_arguments(args)
    parsed = []
    if args.first.class == "User"
      parsed << args.shift
    else
      parsed << current_user
    end
    parsed << args.first.keys.first.to_sym
    parsed << args.first.values.first
    return parsed
  end
end

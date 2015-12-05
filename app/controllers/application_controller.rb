class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout proc{|c| c.request.xhr? ? false : "application" }

  #before_action :authenticate!, except: [:new]
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def authenticate!
    redirect_to ""
  end
end

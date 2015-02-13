class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_language
  def set_language
   if request.headers["Accept-Language"]
    I18n.locale = request.headers["Accept-Language"].scan(/^[a-z]{2}/).first
    I18n.locale = I18n.default_locale
   end
  end

  def auth_user
    session_id = session[:user_id]
   if session_id
      # set current user object to @current_user object variable

     @current_user = User.where(email: session_id).take
     return true 
   else
    #redirect_to(:controller => 'user', :action => ' ')
    return false
   end
  end
end

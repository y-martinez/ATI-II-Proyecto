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
     @current_user = User.where(email: session_id.first).take
     user_attemp=params[:user_id].to_s
     user_session=@current_user.id.to_s
      if user_attemp == user_session
        flash[:message] = "User Authenticated Correctly"
        return true
      else
        redirect_to :login
        flash[:error] = "Wrong User"
        return false
      end
   else
    flash[:error] = "Authentication Required"
    redirect_to :login
    return false
   end
  end
end

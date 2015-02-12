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

  def has_token
   #token = request.headers["token"]
   #has_session = Session.where(token: token).first rescue has_session = nil
   #if has_session then
   	#@user = has_session.user
    #return true
   #end
   #render json: {message: "INVALID_TOKEN"}, status: :forbidden
   #return false
  end
end

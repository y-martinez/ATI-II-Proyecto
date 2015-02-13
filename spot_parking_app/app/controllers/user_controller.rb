class UserController < ApplicationController
 before_action :auth_user, except: :create
 def home
 end
 def index
  session[:usuario_id] = "hola"
 end
 def create
  @user = User.where(email: params[:user][:email]).take rescue user = nil
  if @user
   flash[:message] = "Email already used"

  else
   @user = User.new(name: params[:user][:name],password: params[:user][:password], type_of_user: 'User')
   @user.email = params[:user][:email]
   @user.date_creation = Time.now
   @user.time_of_reservation = nil
   if @user.save then
    flash[:message] = "User Created"
    #redirect_to controller: :session, action: :create
   else
    flash[:message] = "Error"
   end
  end
 end
end

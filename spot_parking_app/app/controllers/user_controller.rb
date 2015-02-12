class UserController < ApplicationController
 before_action :has_token, except: :create
 def home
 end
 def index
 end
 def create
  user = User.where(email: params[:email]).first rescue usuario = nil
  if user then
   flash[:message] = "Email already used"
   #redirect_to controller: :user, action: :formulario
   #return 
  else
   @user = User.new(name: params[:name],password: [:password], type_of_user: 'User')
   @user.email = params[:email]
   #@user.date_creation = Time.now
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

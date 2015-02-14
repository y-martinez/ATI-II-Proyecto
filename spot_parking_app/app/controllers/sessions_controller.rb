class SessionsController < ApplicationController

	def new
		
	end
	
	def create
	  reset_session #al iniciar sesion siempre se deberia borrar lo que habia
	  email = params[:user][:email]
      pass = params[:user][:password]

      user = User.where(email: email, password: pass).take

      if user
      	session[:id_user] = user.email
		#redirect_to controller: :user, action: :portal
		return
      else
      	flash[:message] = "Error"
      	#redirect_to controller: :inicio, action: :formulario
      	return 
      end
	end

  	def destroy
      reset_session
      redirect_to root_path  
      return
  	end

	private
  	def reset_session
	  session[:user_id]=nil
  	end
end

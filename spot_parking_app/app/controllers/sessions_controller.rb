class SessionsController < ApplicationController
 
	before_filter :authenticate_usuario, :except => [:index, :login, :login_attempt, :logout]
	before_filter :save_login_state, :only => [:index, :login, :login_attempt]

	def home
		#Home Page
	end

	def profile
		#Profile Page
	end

	def setting
		#Setting Page
	end

	def login
		#Login Form
	end

	def login_attempt
		authorized_usuario = Usuario.authenticate(params[:name_or_email],params[:login_password])
		if authorized_usuario
			session[:usuario_id] = authorized_usuario.id
			flash[:notice] = "Wow Welcome again, you logged in as #{authorized_usuario.name}"
			redirect_to home_sessions_path()


		else
			flash[:notice] = "Invalid name or Password"
        	flash[:color]= "invalid"
			render "login"	
		end
	end

	def logout
		session[:usuario_id] = nil
		redirect_to :action => 'login'
	end

end
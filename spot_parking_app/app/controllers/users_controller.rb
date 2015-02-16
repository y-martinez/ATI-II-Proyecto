class UsersController < ApplicationController
	before_action :auth_user, :except => [:create , :new]
	def index
		puts "HOLA MUNDO"
	end
	
	def new
		@user=User.new
	end
	def create
		@user = User.where(email: params[:user][:email]).take rescue user = nil
		if @user
			flash[:error] = "Email already used" 
			flash.keep
			redirect_to :sign_in
		else
			if params[:user][:password] != params[:user][:confirmation_password]
				flash[:error] = "Passwords not" 
				redirect_to :sign_in
			else
				@user = User.new(user_params)
				@user.type_of_user = 'User'
				@user.date_creation = Time.now
				@user.time_of_reservation = nil
				if @user.save then
					flash[:message] = "User Created"
					redirect_to :root
				else
					flash[:error] = "Error"
					redirect_to :sign_in
				end
			end
		end
	end

	def delete
		
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password)
		end
end

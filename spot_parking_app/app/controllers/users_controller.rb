class UsersController < ApplicationController
	before_action :auth_user, :except => [:create , :new]
	def index
		puts "HOLA MUNDO"
	end
	
	def new
		@user=User.new
	end

	def create
		@user=User.new(user_params)
		if params[:user][:password] != params[:user][:confirmation_password]
			flash[:error] = "Passwords not"
			render action: 'new'
		else
			@located = User.where(email: params[:user][:email]).take rescue located = nil
			if @located
				flash[:error] = "Email already used" 
				flash.keep
				render action: 'new'
			else
				@user.type_of_user = 'User'
				@user.date_creation = Time.now
				@user.time_of_reservation = nil
				if @user.save then
					flash[:message] = "User Created"
					redirect_to :root
				else
					flash[:error] = "Error"
					render action: 'new'
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

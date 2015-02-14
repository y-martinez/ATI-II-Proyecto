class UsersController < ApplicationController
	#before_action 
	def index
		
	end
	
	def new
		@user=User.new
	end

	def create
		@user = User.where(email: params[:user][:email]).take rescue user = nil
		if @user
			flash[:message] = "Email already used"
			render action: 'new'
		else
			puts user_params
			@user = User.new(user_params)
			@user.type_of_user = 'User'
			@user.date_creation = Time.now
			@user.time_of_reservation = nil
			if @user.save then
				flash[:message] = "User Created"
				puts 'Error 1'
				#redirect_to users_url Error al redireccionar
				redirect_to root_path
			else
				flash[:message] = "Error"
				puts 'Error 2'
				render action: 'new' 
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

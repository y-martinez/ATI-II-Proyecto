class UsersController < ApplicationController
	#before_action 
	def index
		
	end
	
	def new
		@user=User.new
	end

	def create
		@user = User.new(user_params)
		@user.date_creation = Time.now
		@user.time_of_reservation = nil
		if @user.save then
			flash[:message] = "User Created"
			redirect_to users_url
		else
			flash[:message] = "Error"
			render action: 'new'
		end
	end

	def delete
		
	end
end

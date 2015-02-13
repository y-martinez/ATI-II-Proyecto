class HomeController < ApplicationController
	def index
		session[:usuario_id] = nil
	end
end

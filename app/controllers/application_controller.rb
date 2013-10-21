class ApplicationController < ActionController::Base
  protect_from_forgery

  	def sign_in(user)
		session[:user_id] = user.id
		
	end
end

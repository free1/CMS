#encoding: utf-8
module UsersHelper
	def sign_in(user)
		session[:user_id] = user.id
		self.current_user = user
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		@current_user ||= User.find_by_id(session[:user_id]) 
	end

	def signed_in?
		!current_user.nil?
	end

	def sign_out
		self.current_user = nil
		session.delete(:user_id)
	end
end

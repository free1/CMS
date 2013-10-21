#encoding: utf-8
class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_name(params[:session][:name].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to root_path
		else
			flash.now[:error] = '无效用户名！'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_path
	end
end

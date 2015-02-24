class SessionsController < ApplicationController
	def new
		# don't really need anything in here.
		# don't technically need this method, just need new view
	end
		
	def create 
		# 1. find the user by email provided
		user = User.find_by_email(params[:email])
		# if user exists & if valid password
		if user && user.authenticate(params[:password])
			# save user id into session
			session[:user_id] = user.id
			# Redirect to root
			redirect_to root_path, notice: "Signed in successfully"
		# else
		else
			# show flash message "Invalid email and/or password"
			flash.now.alert = "Invalid email address and/or password"
			# show new again
			render :new
			
		end
	end

	def destroy
		session[:user_id] = nil
			# Redirect to root
		redirect_to root_path, notice: "Signed out successfully"
	end

end

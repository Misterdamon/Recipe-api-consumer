class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def show
	end

	def create
		p params
		@user = User.new(username: params[:user][:username])
		@user.password = params[:user][:password_hash]
		@user.save
		session[:id] = @user.id
		if session[:id]
			redirect_to recipes_path
		else
			redirect_to new_user_path
		end
	end

	def update
	end

	def signin_attempt
		@user = User.new
		render :signin
	end

	def signin
		@user = User.find(params[:username])
		if params[:password_hash] == @user.password
			session[:id] = @user.id
			redirect_to recipes_path
		else
			render :signin
		end
	end

	def logout
		session[:id] = nil
		redirect_to root_path
	end
end
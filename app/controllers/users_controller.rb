class UsersController < ApplicationController
  attr_accessor :remember_token
  def new
	@user = User.new
  end

  def show 
	@user = User.find(params[:id])
  end

  def edit
	@user = User.find(params[:id])
  end

  def create
	@user = User.new(user_params)
	if @user.save
		log_in @user
		flash[:success] = "Thanks for signing up!"
		redirect_to @user
	else
		render 'new'
	end
  end

  private

	  def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	  end

end
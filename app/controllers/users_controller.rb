class UsersController < ApplicationController
  attr_accessor :remember_token
  def new
	@user = User.new
  end

  def show 
	@user = User.find(params[:id])
	@address = Address.find_by(user_id: params[:id])
	@charge = Charge.find_by(user_id: params[:id])
	@plans = Plan.all
  end

  def edit
	@user = User.find(params[:id])
  end

  def create
	@user = User.new(user_params)
	if @user.save
		log_in @user

			customer	= Stripe::Customer.create(
			:description	=> "Customer for test@example.com",
			:source		=> params[:stripeToken],
			:email		=> @user.email 
			)	

		@user.stripe_id = customer.id
		@user.save
		redirect_to checkout_path 
	else
		render 'new'
	end
  end

  private

	  def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	  end

end

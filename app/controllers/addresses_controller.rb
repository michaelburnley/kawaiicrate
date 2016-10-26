class AddressesController < ApplicationController
  def new
	if logged_in?
 		@address = Address.new
		@plans = Plan.all
	else
		redirect_to login_path
	end
  end

  def create
	@address = Address.new(address_params)
	@user = current_user
	@address.set_user!(current_user)	
	@charge = Charge.new
	@charge.subscription_checkout(params[:plan_id], @user.stripe_id, params[:card_token])
	if (params[:plan_id] == "tri-monthly") || (params[:plan_id] == "tri-monthly_int")
		(1..3).each do |i|
			@charge = Charge.new		
			@charge.create_multiple_charges(@user.id, params[:plan_id], @user.email, params[:card_token], i)
		end
	elsif (params[:plan_id] == "yearly") || (params[:plan_id] == "yearly_int")
		(1..12).each do |i|
			@charge = Charge.new		
			@charge.create_multiple_charges(@user.id, params[:plan_id], @user.email, params[:card_token], i)
		end
	else
		@charge.create_charge(@user.id, params[:plan_id], @user.email, params[:card_token])
	end

	if @address.save
		redirect_to thankyou_path 
	else
		render 'new'
	end
  end


  def edit
	@user = current_user
	@address.set_user!(current_user)
  end

  private

	def address_params
		params.require(:address).permit(:address1, :address2, :country, :zip_code, :state, :city, :first_name, :last_name, :shipping_address2, :shipping_country, :shipping_zip_code, :shipping_state, :shipping_city, :shipping_first_name, :shipping_last_name, :shipping_address1, :card_token)
	end

end

class Charge < ActiveRecord::Base
	belongs_to :user

 def subscription_checkout(plan_id, stripe_id, stripe_token)
	plan		= Stripe::Plan.retrieve(plan_id)
	customer = Stripe::Customer.retrieve(stripe_id)	
	customer.source = stripe_token
	customer.save
	stripe_subscription = customer.subscriptions.create(:plan => plan.id)
 end

 def create_charge(userid, plan_id, email, card_token)
	self.user_id = userid	
	self.sub_type = plan_id
	self.email = email
	self.card_token = card_token
	self.ship_date = Date.today.at_beginning_of_month.next_month
	self.save
 end

 def create_multiple_charges(userid, plan_id, email, card_token, months)
	self.user_id = userid	
	self.sub_type = plan_id
	self.email = email
	self.card_token = card_token
	if months == 1
		self.ship_date = Date.today.at_beginning_of_month.next_month
	else
		self.ship_date = Date.today.at_beginning_of_month.next_month + months.month
	end
	self.save
 end

 def set_user!(user)
	self.user_id = user.id
 end

end

class ChargesController < ApplicationController

	def new
	end

	def thankyou
	end

	def create
	end

	def plans
		@plans = Plan.all
	end

end

class StaticPagesController < ApplicationController
  def home
	@plans = Plan.all
  end

  def contact
  end

  def faq
  end

  def about
  end
end

class Address < ActiveRecord::Base

attr_accessor :address1, :address2, :city, :state, :zip_code, :country, :first_name, :last_name
belongs_to :user

end

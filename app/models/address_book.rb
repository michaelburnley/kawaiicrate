class AddressBook < ActiveRecord::Base
	belongs_to :user
	has_many :addresses, through :user
end

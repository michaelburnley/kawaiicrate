class Address < ActiveRecord::Base

belongs_to :user
has_many :charges, :through => :user	

accepts_nested_attributes_for :charges
validates :address1, presence: true, length: {maximum: 255} 
validates :address2, presence: true, length: {maximum: 255} 
validates :city, presence: true, length: {maximum: 60} 
validates :country, presence: true, length: {maximum: 75} 
validates :zip_code, presence: true, length: {maximum: 18} 
validates :state, presence: true, length: {maximum: 255} 
	
validates :shipping_address1, presence: true, length: {maximum: 255} 
validates :shipping_address2, presence: true, length: {maximum: 255} 
validates :shipping_city, presence: true, length: {maximum: 60} 
validates :shipping_country, presence: true, length: {maximum: 75} 
validates :shipping_zip_code, presence: true, length: {maximum: 18} 
validates :shipping_state, presence: true, length: {maximum: 255} 


	def set_user!(user)
		self.user_id = user.id
	end

end

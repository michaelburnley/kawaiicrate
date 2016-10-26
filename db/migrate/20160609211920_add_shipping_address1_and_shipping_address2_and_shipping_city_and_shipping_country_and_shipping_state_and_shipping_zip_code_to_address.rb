class AddShippingAddress1AndShippingAddress2AndShippingCityAndShippingCountryAndShippingStateAndShippingZipCodeToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :shipping_address1, :string
    add_column :addresses, :shipping_address2, :string
    add_column :addresses, :shipping_city, :string
    add_column :addresses, :shipping_country, :string
    add_column :addresses, :shipping_state, :string
    add_column :addresses, :shipping_zip_code, :string
  end
end

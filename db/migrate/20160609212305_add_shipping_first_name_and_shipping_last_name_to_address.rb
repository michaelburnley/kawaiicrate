class AddShippingFirstNameAndShippingLastNameToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :shipping_first_name, :string
    add_column :addresses, :shipping_last_name, :string
  end
end

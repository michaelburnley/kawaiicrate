class AddShipDateToCharge < ActiveRecord::Migration
  def change
    add_column :charges, :ship_date, :string
  end
end

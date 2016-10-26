class RemoveOrderIdFromCharge < ActiveRecord::Migration
  def change
    remove_column :charges, :order_id, :string
  end
end

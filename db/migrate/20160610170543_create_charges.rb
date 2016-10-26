class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.integer :order_id
      t.integer :user_id
      t.string :sub_type

      t.timestamps null: false
    end
  end
end

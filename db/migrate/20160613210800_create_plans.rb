class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.float :price
      t.string :interval
      t.string :stripe_id
      t.string :features
      t.integer :display_order
      t.boolean :highlight

      t.timestamps null: false
    end
  end
end

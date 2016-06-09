class CreateAddressBooks < ActiveRecord::Migration
  def change
    create_table :address_books do |t|
      t.integer :address_index
      t.integer :user_index

      t.timestamps null: false
    end
  end
end

class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :city
      t.string :country
      t.string :credit_card
      t.string :expiry

      t.timestamps null: false
    end
  end
end

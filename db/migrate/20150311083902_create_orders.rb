class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.references :product, index: true
      t.references :customer, index: true
      t.boolean :shipped

      t.timestamps null: false
    end
  end
end

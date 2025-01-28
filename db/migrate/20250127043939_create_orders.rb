class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders, id: :uuid do |t|
      t.uuid :customer_id, default: "gen_random_uuid()"
      t.uuid :product_id, default: "gen_random_uuid()"
      t.integer :quantity, default: 0
      t.string :status, default: 'pending'
      t.json :items

      t.timestamps
    end

    add_index :orders, :product_id
    add_index :orders, :customer_id
  end
end

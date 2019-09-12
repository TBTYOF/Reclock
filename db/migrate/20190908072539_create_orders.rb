class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
    	t.references :user, foreign_key: true
    	t.references :on_store_user, foreign_key: true
    	t.integer :variety, default: 1, null: false
			t.integer :pickup, default: 1, null: false
			t.string :maker
			t.string :model
			t.text :symptom
			t.integer :repair_status, default: 1, null: false
			t.text :repair_detail
			t.integer :payment, default: 1, null: false
			t.integer :charge
			t.integer :delivery, default: 1, null: false
			t.datetime :delivery_day

      t.timestamps
    end
  end
end

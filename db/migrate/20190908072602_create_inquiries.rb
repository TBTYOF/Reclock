class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.integer :on_store_user_id
    	t.integer :order_id
			t.integer :user_id
			t.string :title
			t.text :body
			t.boolean :is_read, default: false, null: false

      t.timestamps
    end
  end
end

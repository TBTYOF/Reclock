class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.references :user, foreign_key: true
      t.references :on_store_user, foreign_key: true
    	t.integer :order_id
			t.string :title
			t.text :body
			t.boolean :user_read, default: false, null: false
      t.boolean :on_store_user_read, default: false, null: false

      t.timestamps
    end
  end
end

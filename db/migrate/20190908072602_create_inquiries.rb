class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    # デプロイ時に入れ替える
    create_table :inquiries, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    # create_table :inquiries do |t|
      t.references :user, foreign_key: true
      t.references :on_store_user, foreign_key: true
    	t.integer :order_id
			t.string :title, null: false
			t.text :body, null: false
			t.boolean :user_read, default: false, null: false
      t.boolean :on_store_user_read, default: false, null: false

      t.timestamps
    end
  end
end

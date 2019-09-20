class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
    	t.references :user, foreign_key: true
    	t.references :on_store_user, foreign_key: true
    	t.references :order, foreign_key: true
			t.string :title, null: false
			t.text :body, null: false

      t.timestamps
    end
  end
end

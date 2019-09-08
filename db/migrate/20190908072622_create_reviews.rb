class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
    	t.references :order, foreign_key: true
    	t.references :user, foreign_key: true
			t.string :title
			t.text :body

      t.timestamps
    end
  end
end

class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
    	t.references :inquiry, foreign_key: true
			t.text :body

      t.timestamps
    end
  end
end

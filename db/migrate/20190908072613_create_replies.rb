class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    	t.references :inquiry, foreign_key: true
			t.text :body, null: false
			t.boolean :is_writer, default: false, null: false

      t.timestamps
    end
  end
end

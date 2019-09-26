class CreateCards < ActiveRecord::Migration[5.2]
  def change
  	# デプロイ時に入れ替える
    # create_table :cards, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    create_table :cards do |t|
      t.integer :user_id, null: false
      t.string :customer_id, null: false
      t.string :card_id, null: false

      t.timestamps
    end
  end
end

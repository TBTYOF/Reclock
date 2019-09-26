class CreateMajorCategories < ActiveRecord::Migration[5.2]
  def change
  	# デプロイ時に入れ替える
    # create_table :major_categories, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    create_table :major_categories do |t|
    	t.integer :on_store_user_id
    	t.string :name

      t.timestamps
    end
  end
end

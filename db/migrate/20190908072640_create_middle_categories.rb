class CreateMiddleCategories < ActiveRecord::Migration[5.2]
  def change
  	# デプロイ時に入れ替える
    # create_table :middle_categories, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    create_table :middle_categories do |t|
    	t.integer :major_category_id
    	t.string :name

      t.timestamps
    end
  end
end

class CreateMinorCategories < ActiveRecord::Migration[5.2]
  def change
  	# デプロイ時に入れ替える
    create_table :minor_categories, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    # create_table :minor_categories do |t|
    	t.integer :middle_category_id
    	t.string :name
    	t.string :quote

      t.timestamps
    end
  end
end

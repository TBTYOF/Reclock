class CreateMajorCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :major_categories, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    	t.integer :on_store_user_id
    	t.string :name

      t.timestamps
    end
  end
end

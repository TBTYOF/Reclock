class CreateMiddleCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :middle_categories do |t|
    	t.integer :major_category_id
    	t.string :name

      t.timestamps
    end
  end
end

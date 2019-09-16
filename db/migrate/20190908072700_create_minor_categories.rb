class CreateMinorCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :minor_categories do |t|
    	t.integer :middle_category_id
    	t.string :name
    	t.string :quote

      t.timestamps
    end
  end
end

class CreateMiddleCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :middle_categories do |t|
    	t.references :major_categories, foreign_key: true
    	t.string :name

      t.timestamps
    end
  end
end

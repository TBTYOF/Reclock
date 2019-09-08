class CreateMajorCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :major_categories do |t|
    	t.references :on_store_user, foreign_key: true
    	t.string :name

      t.timestamps
    end
  end
end

class CreateOnStoreUserImages < ActiveRecord::Migration[5.2]
  def change
    create_table :on_store_user_images do |t|
    	t.references :on_store_user, foreign_key: true
      t.string :image_id, null: false

      t.timestamps
    end
  end
end

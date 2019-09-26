class CreateOnStoreUserImages < ActiveRecord::Migration[5.2]
  def change
  	# デプロイ時に入れ替える
    # create_table :on_store_user_images, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    create_table :on_store_user_images do |t|
    	t.references :on_store_user, foreign_key: true
      t.string :image_id, null: false

      t.timestamps
    end
  end
end

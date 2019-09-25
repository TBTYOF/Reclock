class CreateOrderImages < ActiveRecord::Migration[5.2]
  def change
    # create_table :order_images, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    create_table :order_images do |t|
    	t.references :order, foreign_key: true
    	t.string :image_id, null: false

      t.timestamps
    end
  end
end

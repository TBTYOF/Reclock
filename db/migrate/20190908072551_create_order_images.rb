class CreateOrderImages < ActiveRecord::Migration[5.2]
  def change
    create_table :order_images do |t|
    	t.references :order, foreign_key: true
    	t.string :image_id

      t.timestamps
    end
  end
end

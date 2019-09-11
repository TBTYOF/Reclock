class Order < ApplicationRecord
	enum variety:       {未選択: 1, 掛時計: 2, 置時計: 3, ホールクロック: 4, 腕時計: 5, 懐中時計: 6, その他: 7}
  enum pickup:        {未選択: 1, 修理店集荷: 2, 外部宅配: 3, 持参: 4}
  enum repair_status: {集荷前: 1, 見積前: 2, 修理中: 3, 修理完了: 4, 納品済: 5, 取引完了: 6, キャンセル: 7}
  enum delivery:      {未選択: 1, 修理店お届け: 2, 外部宅配: 3, 来訪: 4}

  belongs_to :user
  belongs_to :on_store_user
  has_many :order_images, dependent: :destroy
end

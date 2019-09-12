class Order < ApplicationRecord
	enum variety:       {未選択: 1, 掛時計: 2, 置時計: 3, ホールクロック: 4, 腕時計: 5, 懐中時計: 6, その他: 7}, _suffix: true
  enum pickup:        {未選択: 1, 修理店集荷: 2, 宅配: 3, 持参: 4}, _suffix: true
  enum repair_status: {集荷前: 1, 見積前: 2, 修理中: 3, 修理完了: 4, 支払済み: 5, 納品済: 6, 取引完了: 7, キャンセル: 8}
  enum payment:       {現金支払: 1, 銀行振込: 2, クレジット支払: 3}
  enum delivery:      {未選択: 1, 修理店お届け: 2, 外部宅配: 3, 来訪: 4}, _suffix: true

  belongs_to :user
  belongs_to :on_store_user
  has_many :order_images, dependent: :destroy
  has_many :inquiries, dependent: :destroy
  has_many :reviews, dependent: :destroy
  accepts_attachments_for :order_images, attachment: :image
end

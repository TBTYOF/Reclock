class Order < ApplicationRecord
	enum variety:       {掛時計: 1, 置時計: 2, ホールクロック: 3, 腕時計: 4, 懐中時計: 5, その他: 6}
  enum pickup:        {修理店集荷: 1, 宅配: 2, 持参: 3}, _suffix: true
  enum repair_status: {集荷前: 1, 見積前: 2, 修理中: 3, 修理完了: 4, 支払済み: 5, 納品済: 6, 取引完了: 7, キャンセル: 8}
  enum payment:       {現金支払: 1, 銀行振込: 2, クレジット支払: 3}
  enum delivery:      {未選択: 1, 修理店お届け: 2, 外部宅配: 3, 来訪: 4}, _suffix: true

  belongs_to :user
  belongs_to :on_store_user
  has_many :order_images, dependent: :destroy
  has_many :inquiries, dependent: :destroy
  has_many :reviews, dependent: :destroy
  accepts_attachments_for :order_images, attachment: :image, append: true

  validates :variety, presence: {message: "を選択して下さい"}
  validates :pickup, presence: { message: "を選択して下さい"}
  validates :symptom,
            presence: true,
            length: { maximum: 1000, message: "は1000文字以内で入力して下さい"}
end

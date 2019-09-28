class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name,
            presence: true,
            length: { maximum: 50, message: "50文字以内で入力して下さい"}
  validates :name_kana,
            presence: true,
            length: { maximum: 50, message: "50文字以内で入力して下さい"}
  validates :telephone_number,
            presence: true,
            length: { in: 9..20, message: "9~20文字以内で入力して下さい"},
            format: { with: /\A[0-9]+\z/ , message: "半角数字を入力してください" }
  validates :postcode,
            presence: true,
            length: { is: 7, message: "7文字で入力して下さい"},
            format: { with: /\A[0-9]+\z/ , message: "半角数字を入力してください" }
  validates :address,
            presence: true,
            length: { maximum: 100, message: "100文字以内で入力して下さい"}

  has_many :orders
  has_many :inquiries
  has_many :reviews

  def review_by?(order)
    reviews.where(order_id: order.id).exists?
  end
end

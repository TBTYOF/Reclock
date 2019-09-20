class OnStoreUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image

  has_many :orders
  has_many :inquiries
  has_many :reviews
  has_many :major_categories, inverse_of: :on_store_user
  accepts_nested_attributes_for :major_categories, reject_if: :all_blank, allow_destroy: true
  has_many :on_store_user_images, dependent: :destroy
  accepts_attachments_for :on_store_user_images, attachment: :image

  validates :owner_name,
            presence: true,
            length: { maximum: 50, message: "50文字以内で入力して下さい"}
  validates :owner_name_kana,
            presence: true,
            length: { maximum: 50, message: "50文字以内で入力して下さい"}
  validates :shop_name,
            presence: true
  validates :telephone_number,
            presence: true,
            length: { maximum: 20, message: "20文字以内で入力して下さい"},
            format: { with: /\A[0-9]+\z/ , message: "半角数字を入力してください" }
  validates :postcode,
            presence: true,
            length: { is: 7, message: "7文字で入力して下さい"},
            format: { with: /\A[0-9]+\z/ , message: "半角数字を入力してください" }
  validates :address,
            presence: true,
            length: { maximum: 100, message: "100文字以内で入力して下さい"}

  def self.serch_address(address)
  	where("address like ?", "%#{address}%")
	end

end

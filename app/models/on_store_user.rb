class OnStoreUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum is_quit:{利用中: false, 退会済み: true}

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
            length: { in: 9..20, message: "9~20文字以内で入力して下さい"},
            format: { with: /\A[0-9]+\z/ , message: "半角数字を入力してください" }
  validates :postcode,
            presence: true,
            length: { is: 7, message: "7文字で入力して下さい"},
            format: { with: /\A[0-9]+\z/ , message: "半角数字を入力してください" }
  validates :address,
            presence: true,
            length: { maximum: 100, message: "100文字以内で入力して下さい"}
  validates :greeting,
            length: { maximum: 1000, message: "1000文字以内で入力して下さい"}

  def self.public_and_is_quit?
    where(is_public: true, is_quit: "利用中")
  end

  # def self.public?
  #   where(is_public: true)
  # end

  # def self.is_quit?
  #   where(is_quit: "利用中")
  # end
end

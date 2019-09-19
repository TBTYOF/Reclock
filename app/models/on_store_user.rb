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

  def self.serch_address(address)
  	where("address like ?", "%#{address}%")
	end

end

class OnStoreUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image

  has_many :orders
  has_many :inquiries

  def self.serch_address(address)
  	where("address like ?", "%#{address}%")
	end
end

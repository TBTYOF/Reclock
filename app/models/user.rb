class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :name_kana, presence: true
  validates :telephone_number, presence: true
  validates :postcode, presence: true
  validates :address, presence: true

  has_many :orders
end

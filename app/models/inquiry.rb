class Inquiry < ApplicationRecord
	belongs_to :on_store_user
	belongs_to :user
	belongs_to :order, optional: true
	has_many :replies, dependent: :destroy

	validates :title,
            presence: true,
            length: { maximum: 50, message: "50文字以内で入力して下さい"}
  validates :body,
            presence: true,
            length: { maximum: 1000, message: "1000文字以内で入力して下さい"}
end

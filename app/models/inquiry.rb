class Inquiry < ApplicationRecord
	belongs_to :on_store_user
	belongs_to :user
	belongs_to :order, optional: true
	has_many :replies, dependent: :destroy
end

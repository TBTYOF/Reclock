class Inquiry < ApplicationRecord
	belongs_to :user
	belongs_to :order
	has_many :replies, dependent: :destroy
end

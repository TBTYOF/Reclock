class Review < ApplicationRecord
	belongs_to :user
	belongs_to :on_store_user
	belongs_to :order
end

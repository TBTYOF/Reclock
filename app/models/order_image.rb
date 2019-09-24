class OrderImage < ApplicationRecord
	attachment :image

	belongs_to :order
end

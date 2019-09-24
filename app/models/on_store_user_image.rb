class OnStoreUserImage < ApplicationRecord
	attachment :image
	belongs_to :on_store_user
end

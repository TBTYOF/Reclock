class MajorCategory < ApplicationRecord
	belongs_to :on_store_user
	has_many :middle_categories, inverse_of: :major_category
  accepts_nested_attributes_for :middle_categories, allow_destroy: true
end

class MiddleCategory < ApplicationRecord
	belongs_to :major_category
	has_many :minor_categories, inverse_of: :middle_category
  accepts_nested_attributes_for :minor_categories, allow_destroy: true
end

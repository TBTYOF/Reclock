class Reply < ApplicationRecord
	belongs_to :inquiry

  validates :body,
            presence: true,
            length: { maximum: 1000, message: "1000文字以内で入力して下さい"}
end

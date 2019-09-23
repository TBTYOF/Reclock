module Users::UsersHelper
	def card_by?(user)
    Card.where(user_id: user.id).exists?
  end
end

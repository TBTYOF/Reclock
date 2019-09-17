module OnStoreUsers::OnStoreUsersHelper
	def readed?(inquiries)
		inquiries.each do |inquiry|
			if inquiry.on_store_user_read == false
				return false
			end
		end
	end
end
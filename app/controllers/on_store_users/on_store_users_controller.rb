class OnStoreUsers::OnStoreUsersController < ApplicationController
	def home
		render 'on_store_users/home'
	end

	def form
		@on_store_user = OnStoreUser.new
		if params[:on_store_user].present?
			@email = params[:on_store_user][:email]
			OnStoreUserMailer.with(email: @email).welcome_stor_owner.deliver_later
			redirect_to on_store_users_form_path
		end
	end

	def show
	end

	def edit
		@on_store_user = current_on_store_user
	end

	def update
		@on_store_user = OnStoreUser.find(params[:id])
		@on_store_user.update(on_store_user_params)
		redirect_to on_store_users_on_store_user_path(@on_store_user)
	end

	def sales
		
	end

	def withdrawal
		
	end

	def quit
		
	end

	private
	def on_store_user_params
		params.require(:on_store_user).permit(:owner_name,
																					:owner_name_kana,
																					:shop_name,
																					:image_id,
																					:business_hours,
																					:holiday,
																					:telephone_number,
																					:postcode,
																					:address,
																					:closest_station,
																					:parking,
																					:greeting,
																					:is_public,
																					:is_quit
																					on_store_user_images: [])
	end
end
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
		@major_category = @on_store_user.major_categories.build
		@middle_category = @major_category.middle_categories.build
    @minor_category = @middle_category.minor_categories.build
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
																					:image,
																					:business_hours,
																					:holiday,
																					:telephone_number,
																					:postcode,
																					:address,
																					:closest_station,
																					:parking,
																					:greeting,
																					:is_public,
																					:is_quit,
																					on_store_user_images_images: [],
																					major_categories_attributes: [:id, :name, :_destroy,
                                          middle_categories_attributes: [:id, :name, :_destroy,
                                          minor_categories: [:id, :name, :quote, :_destroy]]])
	end
end
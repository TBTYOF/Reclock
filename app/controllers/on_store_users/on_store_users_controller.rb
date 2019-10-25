class OnStoreUsers::OnStoreUsersController < ApplicationController
	before_action :authenticate_on_store_user!, except: :form
	# URLの直接入力を弾く
	before_action :ensure_correct_on_store_user, only: [:show, :edit, :update]
	before_action :ensure_correct_on_store_url_user, only: [:home, :withdrawal, :quit]
  def ensure_correct_on_store_user
    if current_on_store_user.id != params[:id].to_i
      redirect_to on_store_users_on_store_user_home_path(current_on_store_user)
    end
  end
  def ensure_correct_on_store_url_user
    if current_on_store_user.id != params[:on_store_user_id].to_i
      redirect_to on_store_users_on_store_user_home_path(current_on_store_user)
    end
  end

	def home
		@search = current_on_store_user.orders.ransack(params[:search], search_key: :search)
		render 'on_store_users/home'
	end

	def form
		@on_store_user = OnStoreUser.new
		if params[:on_store_user].present?
			@email = params[:on_store_user][:email]
			OnStoreUserMailer.with(email: @email).welcome_stor_owner.deliver_later
			redirect_to on_store_users_form_path
		end
		if on_store_user_signed_in?
	    @search = current_on_store_user.orders.ransack(params[:search], search_key: :search)
	  end
	end

	def show
    @search = current_on_store_user.orders.ransack(params[:search], search_key: :search)
	end

	def edit
		@on_store_user = current_on_store_user
		@major_category = @on_store_user.major_categories.build
		@middle_category = @major_category.middle_categories.build
    @minor_category = @middle_category.minor_categories.build

    @search = current_on_store_user.orders.ransack(params[:search], search_key: :search)
	end

	def update
		@on_store_user = OnStoreUser.find(params[:id])
		if @on_store_user.update(on_store_user_params)
			redirect_to on_store_users_on_store_user_path(@on_store_user)
		else
			@search = current_on_store_user.orders.ransack(params[:search], search_key: :search)
			@major_category = @on_store_user.major_categories.build
			@middle_category = @major_category.middle_categories.build
	    @minor_category = @middle_category.minor_categories.build
			render :edit
		end
	end

	def withdrawal
		@search = current_on_store_user.orders.ransack(params[:search], search_key: :search)
	end

	def destroy
    on_store_user = OnStoreUser.find(params[:id])
    on_store_user.is_quit = true
    on_store_user.save
    redirect_to on_store_users_logout_path
  end

	private
	def on_store_user_params
		params.require(:on_store_user).permit(:owner_name,
																					:owner_name_kana,
																					:shop_name,
																					:image,
																					:business_hours,
																					:holiday,
																					:email,
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
                                          minor_categories_attributes: [:id, :name, :quote, :_destroy]]])
	end
end
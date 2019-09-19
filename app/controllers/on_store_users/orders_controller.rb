class OnStoreUsers::OrdersController < ApplicationController
	before_action :authenticate_on_store_user!
	# URLの直接入力を弾く
	before_action :ensure_correct_on_store_user
  def ensure_correct_on_store_user
    if current_on_store_user.id != params[:on_store_user_id].to_i
      redirect_to on_store_users_on_store_user_home_path(current_on_store_user)
    end
  end

	def index
		if params[:search].present?
			@search = current_on_store_user.orders.ransack(search_params)
			@orders = @search.result(distinct: true).page(params[:page]).reverse_order
		else
			@search = current_on_store_user.orders.ransack(params[:search], search_key: :search)
			@orders = @search.result(distinct: true).page(params[:page]).reverse_order
		end
	end

	def show
		@search = current_on_store_user.orders.ransack(params[:search], search_key: :search)
		@order = Order.find(params[:id])

		respond_to do |format|
	  	format.html
	  	format.js
	  end
	end

	def edit
		@order = Order.find(params[:id])
		if params[:key].present?
			render '/on_store_users/orders/charge.js.erb'
		end

		respond_to do |format|
	  	format.html
	  	format.js
	  end
	end

	def update
		@order = Order.find(params[:id])
		@order.update(order_params)

		respond_to do |format|
	  	format.html {redirect_to on_store_users_on_store_user_order_path(current_on_store_user, @order)}
	  	format.js {render '/on_store_users/orders/show.js.erb'}
	  end
	end

	private
	def order_params
		params.require(:order).permit(:user_id,
																	:on_store_user_id,
																	:variety,
																	:pickup,
																	:maker,
																	:model,
																	:symptom,
																	:repair_status,
																	:repair_detail,
																	:payment,
																	:charge,
																	:delivery,
																	:delivery_day,
																	order_images_images: [])
	end

	def search_params
		params.require(:search).permit(:s,
    															:user_name_cont,
			   													:repair_status_eq,
			   													:variety_eq,
			   													:user_telephone_number_cont)
  end
end
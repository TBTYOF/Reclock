class OnStoreUsers::OrdersController < ApplicationController
	def index
	end

	def show
		@order = Order.find(params[:id])
		@index = params[:index]

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
end
class Users::OrdersController < ApplicationController
	def new
		@user = current_user
		@shop = OnStoreUser.find(params[:on_store_user_id])
		@order = Order.new
	end

	def create
		user = current_user
		order = user.orders.new(order_params)
		order.save
		redirect_to users_user_order_path(user, order)
	end

	def show
		@user = current_user
		@order = Order.find(params[:id])
	end

	def edit
		
	end

	def update
		
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
																	:charge,
																	:delivery,
																	:delivery_day,
																	order_images_images: [])
	end
end

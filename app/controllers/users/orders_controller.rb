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
		@inquiry = Inquiry.new
	end

	def edit
		@user =current_user
		@order = Order.find(params[:id])

		respond_to do |format|
	  	format.html
	  	format.js
	  end
	end

	def update
		@user = current_user
		@order = Order.find(params[:id])
		@order.update(order_params)
		if @order.repair_status == "修理完了"
			@order.repair_status = "支払済み"
		else
			@order.repair_status = "取引完了"
		end
		@order.save
		if params[:commit] == "後でする"
			redirect_to users_user_order_path(@user, @order)
		else
			respond_to do |format|
		  	format.html
		  	format.js {render '/users/reviews/new.js.erb', order: @order, user: @user}
		  end
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

class Users::OrdersController < ApplicationController
	before_action :authenticate_user!
	# URL直入力弾く
	before_action :ensure_correct_user
	def ensure_correct_user
		if current_user.id != params[:user_id].to_i
			redirect_to root_path
		end
	end

	def new
		@user = current_user
		@shop = OnStoreUser.find(params[:on_store_user_id])
		@order = Order.new
	end

	def create
		@user = current_user
		@order = @user.orders.new(order_params)
		@order.serial_number = @order.on_store_user.orders.count + 1
		if @order.save
			redirect_to users_user_order_path(@user, @order)
		else
			@shop = @order.on_store_user
			render :new
		end
	end

	def show
		@user = current_user
		@order = Order.find(params[:id])
		@inquiries = @order.inquiries
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
			@review_create_key = true
			respond_to do |format|
		  	format.html
		  	format.js {render '/users/reviews/new.js.erb', order: @order, user: @user, review_create_key: @review_create_key}
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

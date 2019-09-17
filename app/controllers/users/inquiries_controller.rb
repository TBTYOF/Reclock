class Users::InquiriesController < ApplicationController
	def new
		@inquiry = Inquiry.new
		@user = current_user
		@shop = OnStoreUser.find(params[:shop_id])
		@inquiry_creat_url = "/users/users/#{@user.id}/shops/#{@shop.id}/inquiry"
		if params[:order_id]
			@order = Order.find(params[:order_id])
		end

		respond_to do |format|
	    format.html
	    format.js {render '/shared/inquiries/new.js.erb'}
	   end
	end

	def create
		inquiry = current_user.inquiries.new(inquiry_params)
		@shop = OnStoreUser.find(params[:shop_id])
		inquiry.on_store_user_id = @shop.id
		# 注文前の問合せか後か
		if params[:inquiry][:order_id].present?
			@order = Order.find(params[:inquiry][:order_id])
			inquiry.order_id = @order.id
		end
		inquiry.save
		if params[:inquiry][:order_id].present?
			# partial表示のためのインスタンス変数（注文に対する）
			@inquiries = @order.inquiries
		else
			# partial表示のためのインスタンス変数（注文前）
			@inquiries = Inquiry.where(user_id: current_user, on_store_user_id:  @shop.id, order_id: nil)
		end

		respond_to do |format|
		  format.html
		  format.js {render '/shared/inquiries/inquiry.js.erb'}
		end
	end

	def index
		respond_to do |format|
		  format.html
		  format.js {render '/shared/inquiries/index.js.erb'}
		end
	end

	def inquiry
		@shop = OnStoreUser.find(params[:shop_id])
		if params[:order_id] != nil
			@order = Order.find(params[:order_id])
			@inquiries = @order.inquiries
		else
			@inquiries = Inquiry.where(user_id: current_user, on_store_user_id:  @shop.id, order_id: nil)
		end

		respond_to do |format|
		  format.html
		  format.js {render '/shared/inquiries/inquiry.js.erb'}
		 end
	end

	def show
		@user = current_user
		@shop = OnStoreUser.find(params[:shop_id])
		@inquiry = Inquiry.find(params[:id])
		@reply_new_url = "/users/users/#{@user.id}/inquiries/#{@inquiry.id}/replies/new"
		if params[:partial_key].present?
			@partial_key = params[:partial_key]
		end
		if params[:order_id].present?
			@order = Order.find(params[:order_id])
			@reply_new_url = "/users/users/#{@user.id}/orders/#{@order.id}/inquiries/#{@inquiry.id}/replies/new"
		end

		respond_to do |format|
		  format.html
		  format.js {render '/shared/inquiries/show.js.erb'}
		 end
	end

	private
	def inquiry_params
		params.require(:inquiry).permit(:on_store_user_id,
																		:order_id,
																		:user_id,
																		:title,
																		:body,
																		:is_read)
	end
end

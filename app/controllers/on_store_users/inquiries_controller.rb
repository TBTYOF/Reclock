class OnStoreUsers::InquiriesController < ApplicationController
	def new
		@inquiry = Inquiry.new
		@order = Order.find(params[:order_id])
		@inquiry_creat_url = "/on_store_users/on_store_users/#{current_on_store_user.id}/orders/#{@order.id}/inquiries"

		respond_to do |format|
	    format.html
	    format.js {render '/shared/inquiries/new.js.erb'}
	   end
	end

	def create
		@shop = current_on_store_user
		@order = Order.find(params[:inquiry][:order_id])
		inquiry = @shop.inquiries.new(inquiry_params)
		inquiry.user_id = @order.user.id
		inquiry.order_id = @order.id
		inquiry.on_store_user_read = true
		@inquiries = @order.inquiries
		inquiry.save

		respond_to do |format|
		  format.html
		  format.js {render '/shared/inquiries/inquiry.js.erb'}
		end
	end

	def index
		if params[:partial_key].present?
			@shop = current_on_store_user
			@order = Order.find(params[:order_id])
			@inquiries = @order.inquiries

			respond_to do |format|
			  format.html
			  format.js {render '/shared/inquiries/inquiry.js.erb'}
			end
		else
			@user = current_on_store_user

			respond_to do |format|
			  format.html
			  format.js {render '/shared/inquiries/index.js.erb'}
			end
		end
	end

	def show
		@inquiry = Inquiry.find(params[:id])
		@user = @inquiry.user
		@shop = current_on_store_user
		@reply_new_url = "/on_store_users/on_store_users/#{@shop.id}/inquiries/#{@inquiry.id}/replies/new"
		if params[:partial_key].present?
			@partial_key = params[:partial_key]
		end
		if params[:order_id].present?
			@order = Order.find(params[:order_id])
			@reply_new_url = "/on_store_users/on_store_users/#{@shop.id}/orders/#{@order.id}/inquiries/#{@inquiry.id}/replies/new"
		end
		# 既読処理
		@inquiry.on_store_user_read = true
		@inquiry.save

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
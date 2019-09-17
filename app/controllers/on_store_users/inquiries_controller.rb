class OnStoreUsers::InquiriesController < ApplicationController
	def new
		@inquiry = Inquiry.new
		@user = 
		@shop = current_on_store_user
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
		
	end

	def index
		@user = current_on_store_user
		respond_to do |format|
		  format.html
		  format.js {render '/shared/inquiries/index.js.erb'}
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
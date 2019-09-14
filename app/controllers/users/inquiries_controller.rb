class Users::InquiriesController < ApplicationController
	def new
		@user = current_user
		@order = Order.find(params[:order_id])
		@inquiry = Inquiry.new

		respond_to do |format|
	    format.html
	    format.js
	   end
	end

	def create
		if params[:order_id]
			@user = current_user
			@order = Order.find(params[:order_id])
			inquiry = @order.inquiries.new(inquiry_params)
			inquiry.on_store_user_id = @order.on_store_user.id
			inquiry.user_id = @user.id
			inquiry.save

			respond_to do |format|
		  	format.html
		  	format.js {render '/users/inquiries/inquiry.js.erb'}
		  end
		else
		end
	end

	def index
		respond_to do |format|
		  format.html
		  format.js
		end
	end

	def inquiry
		@order = Order.find(params[:order_id])

		respond_to do |format|
		  format.html
		  format.js
		 end
	end

	def show
		if params[:view_key] != nil
			@view_key = params[:view_key]
			@view_valu = params[:view_valu]
		end
		@user = current_user
		@inquiry = Inquiry.find(params[:id])
		if params[:order_id] != nil
			@order = Order.find(params[:order_id])
		end

		respond_to do |format|
		  format.html
		  format.js
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

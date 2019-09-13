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
		@user = current_user
		@order = Order.find(params[:order_id])
		inquiry = @order.inquiries.new(inquiry_params)
		inquiry.user_id = @user.id
		inquiry.save

		respond_to do |format|
	  	format.html
	  	format.js {render '/users/orders/inquiry.js.erb', order: @order, user: @user}
	  end
	end

	private
	def inquiry_params
		params.require(:inquiry).permit(:order_id,
																		:user_id,
																		:title,
																		:body,
																		:is_read)
	end
end

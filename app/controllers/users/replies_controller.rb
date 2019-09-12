class Users::RepliesController < ApplicationController
	def new
		@reply = Reply.new
		@user = current_user
		@order = Order.find(params[:order_id])
		@inquiry = Inquiry.find(params[:inquiry_id])
		@index = params[:index]

		respond_to do |format|
	  	format.html
	  	format.js
	  end
	end

	def create
		@user = current_user
		@order = Order.find(params[:order_id])
		@inquiry = Inquiry.find(params[:inquiry_id])
		reply = @inquiry.replies.new(repliy_params)
		reply.save

		respond_to do |format|
	  	format.html
	  	format.js {render '/users/orders/inquiry.js.erb', order: @order, user: @user}
	  end
	end

	private
	def repliy_params
		params.require(:reply).permit(:inquiry_id, :body)
	end
end

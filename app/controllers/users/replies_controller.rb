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
		@index = params[:index]
		reply = @inquiry.replies.new(repliy_params)
		reply.save

		@update = true

		respond_to do |format|
	  	format.html
	  	format.js {render '/users/orders/inquiry.js.erb', index: @index, inquiry: @inquiry, update: @update}
	  end
	end

	def show
		
	end

	private
	def repliy_params
		params.require(:reply).permit(:inquiry_id, :body, :is_writer)
	end
end

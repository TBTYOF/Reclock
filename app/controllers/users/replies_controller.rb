class Users::RepliesController < ApplicationController
	def new
		@reply = Reply.new
		@inquiry = Inquiry.find(params[:inquiry_id])
		@reply_creat_url = "/users/users/#{current_user.id}/inquiries/#{@inquiry.id}/replies"
		if params[:order_id].present?
			@order = Order.find(params[:order_id])
			@reply_creat_url = "/users/users/#{current_user.id}/orders/#{@order.id}/inquiries/#{@inquiry.id}/replies"
		end

		respond_to do |format|
	  	format.html
	  	format.js {render '/shared/replies/new.js.erb'}
	  end
	end

	def create
		@user = current_user
		@inquiry = Inquiry.find(params[:inquiry_id])
		reply = @inquiry.replies.new(repliy_params)
		reply.save
		# replyを返した時の判定（_showを表示するのに必要）
		# @is_reply = true

		if params[:order_id] != nil
			@order = Order.find(params[:order_id])
			@reply_new_url = "/users/users/#{current_user.id}/orders/#{@order.id}/inquiries/#{@inquiry.id}/replies/new"

			respond_to do |format|
		  	format.html
		  	format.js {render '/shared/replies/show.js.erb'}
		  end
		else
			@reply_new_url = "/users/users/#{current_user.id}/inquiries/#{@inquiry.id}/replies/new"
			respond_to do |format|
		  	format.html
		  	format.js {render '/shared/replies/show.js.erb'}
		  end
		end
	end

	def show
	end

	private
	def repliy_params
		params.require(:reply).permit(:inquiry_id, :body, :is_writer)
	end
end

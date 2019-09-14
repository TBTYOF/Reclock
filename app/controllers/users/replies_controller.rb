class Users::RepliesController < ApplicationController
	def new
		@reply = Reply.new
		@user = current_user
		@inquiry = Inquiry.find(params[:inquiry_id])
		@index = params[:index]
		if params[:order_id] != nil
			@order = Order.find(params[:order_id])
		end

		respond_to do |format|
	  	format.html
	  	format.js
	  end
	end

	def create
		@user = current_user
		@inquiry = Inquiry.find(params[:inquiry_id])
		@index = params[:index]
		reply = @inquiry.replies.new(repliy_params)
		reply.save
		# replyを返した時の判定（_showを表示するのに必要）
		@is_reply = true

		if params[:order_id] != nil
			@order = Order.find(params[:order_id])

			respond_to do |format|
		  	format.html
		  	format.js {render '/users/replies/show.js.erb'}
		  end
		else
			respond_to do |format|
		  	format.html
		  	format.js {render '/users/replies/show.js.erb', index: @index, inquiry: @inquiry, is_reply: @is_reply}
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

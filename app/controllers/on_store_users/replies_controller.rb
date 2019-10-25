class OnStoreUsers::RepliesController < ApplicationController
	before_action :authenticate_on_store_user!
	# URLの直接入力を弾く
	before_action :ensure_correct_on_store_user
  def ensure_correct_on_store_user
    if current_on_store_user.id != params[:on_store_user_id].to_i
      redirect_to on_store_users_on_store_user_home_path(current_on_store_user)
    end
  end

	def new
		@reply = Reply.new
		@inquiry = Inquiry.find(params[:inquiry_id])
		@reply_creat_url = "/on_store_users/on_store_users/#{current_on_store_user.id}/inquiries/#{@inquiry.id}/replies"
		if params[:order_id].present?
			binding.pry
			@order = Order.find(params[:order_id])
			@reply_creat_url = "/on_store_users/on_store_users/#{current_on_store_user.id}/orders/#{@order.id}/inquiries/#{@inquiry.id}/replies"
		end

		respond_to do |format|
	  	format.html
	  	format.js {render '/shared/replies/new.js.erb'}
	  end
	end

	def create
		@inquiry = Inquiry.find(params[:inquiry_id])
		reply = @inquiry.replies.new(repliy_params)
		reply.is_writer = true
		reply.save
		# 未読処理
		@inquiry.user_read = false
		@inquiry.save
		# エンドユーザへ通知
		UserMailer.with(inquiry: @inquiry, reply: reply).new_reply.deliver_later

		if params[:order_id] != nil
			@order = Order.find(params[:order_id])
			@reply_new_url = "/on_store_users/on_store_users/#{current_on_store_user.id}/orders/#{@order.id}/inquiries/#{@inquiry.id}/replies/new"

			respond_to do |format|
		  	format.html
		  	format.js {render '/shared/replies/show.js.erb'}
		  end
		else
			@reply_new_url = "/on_store_users/on_store_users/#{current_on_store_user.id}/inquiries/#{@inquiry.id}/replies/new"
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

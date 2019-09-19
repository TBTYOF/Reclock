class OnStoreUsers::InquiriesController < ApplicationController
	before_action :authenticate_on_store_user!
	# URLの直接入力を弾く
	before_action :ensure_correct_on_store_user
  def ensure_correct_on_store_user
    if current_on_store_user.id != params[:on_store_user_id].to_i
      redirect_to on_store_users_on_store_user_home_path(current_on_store_user)
    end
  end

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
			@order = Order.find(params[:order_id])
			@shop = current_on_store_user
			@inquiries = @order.inquiries

			@search = current_on_store_user.orders.ransack(params[:search], search_key: :search)

			respond_to do |format|
			  format.html
			  format.js {render '/shared/inquiries/inquiry.js.erb'}
			end
		else
			@user = current_on_store_user
			@q = @user.inquiries.ransack(params[:q])
			@inquiries = @q.result(distinct: true).page(params[:page]).reverse_order
			@search = current_on_store_user.orders.ransack(params[:search], search_key: :search)


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
																		:user_read,
																		:on_store_user_read)
	end

	def search_params
    params.require(:q).permit(:s,
    													:user_name_cont,
    													:user_read_in,
    													:on_store_user_read_in)
  end
end
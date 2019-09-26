class OnStoreUsers::OrdersController < ApplicationController
	before_action :authenticate_on_store_user!
	# URLの直接入力を弾く
	before_action :ensure_correct_on_store_user
  def ensure_correct_on_store_user
    if current_on_store_user.id != params[:on_store_user_id].to_i
      redirect_to on_store_users_on_store_user_home_path(current_on_store_user)
    end
  end

	def index
		if params[:search].present? || params[:q].present?
			if params[:q].present?
				@q = current_on_store_user.orders.ransack(search_params)
				@search = current_on_store_user.orders.ransack(params[:search], search_key: :search)
				@orders = @q.result(distinct: true).page(params[:page]).reverse_order
			else
				@q = current_on_store_user.orders.ransack(params[:q])
				@search = current_on_store_user.orders.ransack(telephone_number_search_params)
				@orders = @search.result(distinct: true).page(params[:page]).reverse_order
			end
		else
			@q = current_on_store_user.orders.ransack(params[:q])
			@search = current_on_store_user.orders.ransack(params[:search], search_key: :search)
			@orders = @search.result(distinct: true).page(params[:page]).reverse_order
		end
	end

	def show
		@search = current_on_store_user.orders.ransack(params[:search], search_key: :search)
		@order = Order.find(params[:id])

		if params[:key] == "repair"
			respond_to do |format|
		  	format.html
		  	format.js {render '/on_store_users/orders/repair_detail.js.erb'}
		  end
		end

		respond_to do |format|
	  	format.html
	  	format.js
	  end
	end

	def edit
		@order = Order.find(params[:id])
		if params[:key] == "charge"

			respond_to do |format|
		  	format.html
		  	format.js {render '/on_store_users/orders/charge.js.erb'}
		  end
		elsif params[:key] == "repair"

			respond_to do |format|
		  	format.html
		  	format.js {render '/on_store_users/orders/repair_edit.js.erb'}
		  end
		end

		respond_to do |format|
	  	format.html
	  	format.js
	  end
	end

	def update
		@order = Order.find(params[:id])
		@order.update(order_params)

		if params[:order][:repair_key].present?
			if @order.repair_status == "取引完了"
				redirect_to on_store_users_on_store_user_order_path(current_on_store_user, @order)
			else
				respond_to do |format|
			  	format.html
			  	format.js {render '/on_store_users/orders/repair_detail.js.erb'}
			  end
			end
		else
			respond_to do |format|
		  	format.html {redirect_to on_store_users_on_store_user_order_path(current_on_store_user, @order)}
		  	format.js {render '/on_store_users/orders/show.js.erb'}
		  end
		end
	end

	private
	def order_params
		params.require(:order).permit(:user_id,
																	:on_store_user_id,
																	:variety,
																	:pickup,
																	:maker,
																	:model,
																	:symptom,
																	:repair_status,
																	:repair_detail,
																	:payment,
																	:charge,
																	:delivery,
																	:delivery_day,
																	order_images_images: [])
	end

	def telephone_number_search_params
		params.require(:search).permit(:user_telephone_number_cont)
  end
  def search_params
		params.require(:q).permit(:s,
    															:user_name_cont,
			   													:repair_status_eq,
			   													:variety_eq)
  end
end
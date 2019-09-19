class Admins::OrdersController < ApplicationController
	def index
		if params[:search].present?
			@q = Order.ransack(search_params)
			@orders = @q.result(distinct: true).page(params[:page]).reverse_order
		else
			@q = Order.ransack(params[:q])
			@orders = @q.result(distinct: true).page(params[:page]).reverse_order
		end
	end

	def show
		@order = Order.find(params[:id])
	end

	def search_params
    params.require(:q).permit(:s,
    													:shop_name_cont,
    													:owner_name_cont,
    													:telephone_number_cont,
    													:email_cont)
  end
end

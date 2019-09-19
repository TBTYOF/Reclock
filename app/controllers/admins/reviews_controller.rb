class Admins::ReviewsController < ApplicationController
	def index
		if params[:search].present?
			@q = Review.ransack(search_params)
			@reviews = @q.result(distinct: true).page(params[:page]).reverse_order
		else
			@q = Review.ransack(params[:q])
			@reviews = @q.result(distinct: true).page(params[:page]).reverse_order
		end
	end

	def search_params
    params.require(:q).permit(:s,
    													:user_name_cont,
    													:on_store_user_shop_name_cont,
    													:on_store_user_read_in,
    													:user_read_in)
  end
end

class Admins::ReviewsController < ApplicationController
	before_action :authenticate_admin!

	def index
		if params[:search].present?
			@q = Review.ransack(search_params)
			@reviews = @q.result(distinct: true).page(params[:page]).reverse_order
		else
			@q = Review.ransack(params[:q])
			@reviews = @q.result(distinct: true).page(params[:page]).reverse_order
		end
	end

	def destroy
		@q = Review.ransack(params[:q])
		@reviews = @q.result(distinct: true).page(params[:page]).reverse_order
		review = Review.find(params[:id])
		review.destroy
		redirect_to admins_reviews_path
	end

	def search_params
    params.require(:q).permit(:s,
    													:user_name_cont,
    													:on_store_user_shop_name_cont)
  end
end

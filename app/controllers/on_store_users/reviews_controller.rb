class OnStoreUsers::ReviewsController < ApplicationController
	before_action :authenticate_on_store_user!
	# URLの直接入力を弾く
	before_action :ensure_correct_on_store_user
  def ensure_correct_on_store_user
    if current_on_store_user.id != params[:on_store_user_id].to_i
      redirect_to on_store_users_on_store_user_home_path(current_on_store_user)
    end
  end

	def index
		@search = current_on_store_user.orders.ransack(params[:search], search_key: :search)
		if params[:search].present?
			@q = Review.ransack(search_params)
			@reviews = @q.result(distinct: true).page(params[:page]).reverse_order
		else
			@q = Review.ransack(params[:q])
			@reviews = @q.result(distinct: true).page(params[:page]).reverse_order
		end
	end

	def destroy
		@search = current_on_store_user.orders.ransack(params[:search], search_key: :search)
		@q = Review.ransack(params[:q])
		@reviews = @q.result(distinct: true).page(params[:page]).reverse_order
		review = Review.find(params[:id])
		review.destroy
		redirect_to on_store_users_on_store_user_reviews_path(current_on_store_user)
	end

	def search_params
    params.require(:q).permit(:s, :user_name_cont)
  end
end

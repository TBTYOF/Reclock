class Users::ReviewsController < ApplicationController
	def new
		@user = current_user
		@order = Order.find(params[:order_id])
		@review = Review.new
	end

	def create
		
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end

	private
	def review_params
		params.require(:review).permit(:order_id, :user_id, :title, :body)
	end
end

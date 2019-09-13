class Users::ReviewsController < ApplicationController
	def new
		@user = current_user
		@order = Order.find(params[:order_id])
		@review = Review.new

		respond_to do |format|
	  	format.html
	  	format.js
	  end
	end

	def create
		@user = current_user
		@order = Order.find(params[:order_id])
		review = @user.reviews.new(review_params)
		review.order_id = @order.id
		review.save
		redirect_to users_user_order_path(@user, @order)
	end

	def show
		@user = User.find(params[:user_id])
		@order = Order.find(params[:order_id])
	end

	def edit
		@user = current_user
		@order = Order.find(params[:order_id])
		@review = Review.find(params[:id])

		respond_to do |format|
	  	format.html
	  	format.js
	  end
	end

	def update
		@user = current_user
		@order = Order.find(params[:order_id])
		review = Review.find(params[:id])
		review.update(review_params)

		respond_to do |format|
	  	format.html
	  	format.js {render '/users/reviews/show.js.erb', order: @order, user: @user}
	  end
	end

	def destroy
		user = current_user
		order = Order.find(params[:order_id])
		review = Review.find(params[:id])
		review.destroy
		redirect_to users_user_order_path(user, order)
	end

	private
	def review_params
		params.require(:review).permit(:order_id, :user_id, :title, :body)
	end
end

class Users::ReviewsController < ApplicationController
	before_action :authenticate_user!
	# URL直入力弾く
	before_action :ensure_correct_user
	def ensure_correct_user
		if current_user.id != params[:user_id].to_i
			redirect_to root_path
		end
	end

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
		@review = @user.reviews.new(review_params)
		@review.order_id = @order.id
		@review.on_store_user_id = @order.on_store_user.id
		@review.save
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
		params.require(:review).permit(:order_id, :user_id, :on_store_user_id, :title, :body)
	end
end

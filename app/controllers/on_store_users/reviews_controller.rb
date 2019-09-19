class OnStoreUsers::ReviewsController < ApplicationController
	def index
		@search = current_on_store_user.orders.ransack(params[:search], search_key: :search)
	end

	def destroy
		
	end
end

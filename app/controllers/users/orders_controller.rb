class Users::OrdersController < ApplicationController
	def new
		@user = current_user
		@shop = OnStoreUser.find(params[:on_store_user_id])
		@order = Oder.new
	end

	def create
		
	end

	def show
		
	end

	def edit
		
	end

	def update
		
	end



end

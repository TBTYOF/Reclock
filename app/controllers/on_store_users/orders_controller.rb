class OnStoreUsers::OrdersController < ApplicationController
	def index
		
	end

	def show
		@order = Order.find(params[:id])
		@index = params[:index]
	end

	def edit
		
	end

	def update
		
	end
end
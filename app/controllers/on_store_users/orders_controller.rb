class OnStoreUsers::OrdersController < ApplicationController
	def index
	end

	def show
		@order = Order.find(params[:id])
		@index = params[:index]

		respond_to do |format|
	  	format.html
	  	format.js
	  end
	end

	def edit
		@order = Order.find(params[:id])

		respond_to do |format|
	  	format.html
	  	format.js
	  end
	end

	def update
		binding.pry
		
		respond_to do |format|
	  	format.html
	  	format.js
	  end
	end
end
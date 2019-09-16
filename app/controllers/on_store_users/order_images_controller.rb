class OnStoreUsers::OrderImagesController < ApplicationController
	def destroy
		@order = Order.find(params[:order_id])
		order_image = OrderImage.find(params[:id])
		order_image.destroy

		respond_to do |format|
	  	format.html
	  	format.js {render '/on_store_users/orders/edit.js.erb'}
	  end
	end
end

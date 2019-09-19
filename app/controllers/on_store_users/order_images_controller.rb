class OnStoreUsers::OrderImagesController < ApplicationController
	before_action :authenticate_on_store_user!
	# URLの直接入力を弾く
	before_action :ensure_correct_on_store_user
  def ensure_correct_on_store_user
    if current_on_store_user.id != params[:order_id].on_store_user.id
      redirect_to on_store_users_on_store_user_home_path(current_on_store_user)
    end
  end

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

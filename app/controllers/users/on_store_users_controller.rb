class Users::OnStoreUsersController < ApplicationController
	def index
		if params[:address] == nil
			@shops = OnStoreUser.page(params[:page]).reverse_order
		else
			@shops = OnStoreUser.page(params[:page]).reverse_order
			@shops = @shops.serch_address(params[:address])
		end
	end

	def show
		@shop = OnStoreUser.find(params[:id])
		@order = current_user.inquiries.where(on_store_user_id: @shop.id)
	end
end

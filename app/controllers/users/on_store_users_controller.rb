class Users::OnStoreUsersController < ApplicationController
	def index
		@shops = OnStoreUser.page(params[:page]).reverse_order
		@shop = @shops.first
	end

	def show
		
	end
end

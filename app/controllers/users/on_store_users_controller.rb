class Users::OnStoreUsersController < ApplicationController
	def index
		@shops = OnStoreUser.all
	end

	def show
		
	end
end

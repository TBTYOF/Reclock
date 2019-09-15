class OnStoreUsers::OnStoreUsersController < ApplicationController
	def home
		render 'on_store_users/home'
	end

	def form
		@on_store_user = OnStoreUser.new
		if params[:on_store_user].present?
			@email = params[:on_store_user][:email]
			OnStoreUserMailer.with(email: @email).welcome_stor_owner.deliver_later
			redirect_to on_store_users_form_path
		end
	end

	def show
		
	end

	def edit
		
	end

	def update
		
	end

	def sales
		
	end

	def withdrawal
		
	end

	def quit
		
	end
end
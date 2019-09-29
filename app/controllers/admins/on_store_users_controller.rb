class Admins::OnStoreUsersController < ApplicationController
	before_action :authenticate_admin!
	def index
		if params[:search].present?
			@q = OnStoreUser.ransack(search_params)
			@on_store_users = @q.result(distinct: true).page(params[:page]).reverse_order
		else
			@q = OnStoreUser.ransack(params[:q])
			@on_store_users = @q.result(distinct: true).page(params[:page]).reverse_order
		end
	end

	def show
		@on_store_user = OnStoreUser.find(params[:id])
	end

	def quit
	end

	def search_params
    params.require(:q).permit(:s,
    													:shop_name_cont,
    													:owner_name_cont,
    													:telephone_number_cont,
    													:email_cont)
  end
end

class Admins::UsersController < ApplicationController
	before_action :authenticate_admin!

	def index
		if params[:search].present?
			@q = User.ransack(search_params)
			@users = @q.result(distinct: true).page(params[:page]).reverse_order
		else
			@q = User.ransack(params[:q])
			@users = @q.result(distinct: true).page(params[:page]).reverse_order
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
		user.is_quit = "利用中"
		user.save
		redirect_back(fallback_location: root_path)
	end

	def destroy
		user = User.find(params[:id])
		user.is_quit = "退会済み"
		user.save
		redirect_back(fallback_location: root_path)
	end

	private
	def search_params
    params.require(:q).permit(:s,
    													:name_cont,
    													:telephone_number_cont,
    													:email_cont)
  end

end

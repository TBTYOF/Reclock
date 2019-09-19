class Admins::UsersController < ApplicationController
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

	def quit
		
	end

	def search_params
    params.require(:q).permit(:s,
    													:name_cont,
    													:telephone_number_cont,
    													:email_cont)
  end

end

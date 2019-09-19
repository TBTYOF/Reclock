class Admins::InquiriesController < ApplicationController
	def index
		if params[:search].present?
			@q = Inquiry.ransack(search_params)
			@inquiries = @q.result(distinct: true).page(params[:page]).reverse_order
		else
			@q = Inquiry.ransack(params[:q])
			@inquiries = @q.result(distinct: true).page(params[:page]).reverse_order
		end
	end

	def show
		@inquiry = Inquiry.find(params[:id])
	end

	def search_params
    params.require(:q).permit(:s,
    													:user_name_cont,
    													:on_store_user_shop_name_cont,
    													:on_store_user_read_in,
    													:user_read_in)
  end
end

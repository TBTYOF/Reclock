class Users::OnStoreUsersController < ApplicationController

	def index
  	if params[:q].present?
  		@q = OnStoreUser.includes(major_categories: {middle_categories: :minor_categories}).ransack(search_params)
  		@shops = @q.result(distinct: true).public?.page(params[:page]).reverse_order
      @search_by = []
      @search_by = @search_by + [params[:q][:address_cont]]
      @search_by = @search_by + [params[:q][:major_categories_name_or_major_categories_middle_categories_name_or_major_categories_middle_categories_minor_categories_name_cont]]
    else
      @q = OnStoreUser.includes(major_categories: {middle_categories: :minor_categories}).ransack(params[:q])
      @shops = @q.result(distinct: true).public?.page(params[:page]).reverse_order
    end
	end

	def show
		@shop = OnStoreUser.find(params[:id])
		@reviews = @shop.reviews.page(params[:page]).reverse_order
		@inquiries = Inquiry.where(user_id: current_user, on_store_user_id:  @shop.id)
	end

	private
	def search_params
    params.require(:q).permit(:address_cont,
                              :major_categories_name_or_major_categories_middle_categories_name_or_major_categories_middle_categories_minor_categories_name_cont)
  end

end

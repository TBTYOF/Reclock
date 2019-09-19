class Users::OnStoreUsersController < ApplicationController

	def index
		if params[:address] == nil
			@q = MiddleCategory.ransack(params[:q])
			@shops = OnStoreUser.page(params[:page]).reverse_order
		else
			@q = MiddleCategory.ransack(params[:q])
			@shops = OnStoreUser.page(params[:page]).reverse_order
			@shops = @shops.serch_address(params[:address])
		end
		if params[:q].present?
			@q =  MiddleCategory.ransack(search_params)
			categories = @q.result(distinct: true)
	    @shops = category_sarch(categories)
	  end
	end

	def show
		@shop = OnStoreUser.find(params[:id])
		@inquiries = Inquiry.where(user_id: current_user, on_store_user_id:  @shop.id, order_id: nil)
	end

	private
	def search_params
    params.require(:q).permit(:major_category_name_or_name_or_minor_categories_name_cont)
  end

  # major_category, middle_category, minor_categoryから店舗をキーワード検索
  def category_sarch(text)
	    def same_exclusion(sarch_middle_categories)
	      middle_categories = []
	      i = -1
	      sarch_middle_categories.each do |sarch_middle_category|
	        if middle_categories[i] != sarch_middle_category
	          i += 1
	          middle_categories = middle_categories + [sarch_middle_category]
	        end
	      end
	      return middle_categories
	    end

	    def convert_to_store(results_middle_categories)
	      major_categories =[]
	      on_store_users = []
	      i = 0
	      results_middle_categories.each_with_index do |results_middle_category, index|
	        if index == 0
	          major_categories = major_categories + [results_middle_category]
	          on_store_users = on_store_users + [results_middle_category.major_category.on_store_user]
	        end
	        if major_categories[i].major_category_id != results_middle_category.major_category_id
	          i += 1
	          major_categories = major_categories + [results_middle_category]
	          on_store_users = on_store_users + [results_middle_category.major_category.on_store_user]
	        end
	      end
	      return on_store_users
	    end

	    # middle_categoryの重複除外
	    search_results = same_exclusion(text)
	    # on_store_userへ変換
	    ground_results = convert_to_store(search_results)
	    return ground_results
	  end
end

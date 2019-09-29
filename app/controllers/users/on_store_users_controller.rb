class Users::OnStoreUsersController < ApplicationController

	def index
		if params[:address].present?
			@q = MiddleCategory.ransack(params[:q])
			@shops = OnStoreUser.page(params[:page]).reverse_order
			@shops = @shops.public?(@shops).serch_address(params[:address])
			@search_by = params[:address]
		else
			@q = MiddleCategory.ransack(params[:q])
			@shops = OnStoreUser.public?(@shops).page(params[:page]).reverse_order
		end
		if params[:q].present?
			@q = MiddleCategory.ransack(search_params)
			categories = @q.result(distinct: true).reverse_order
			@shops = store_sarch(categories)
	    # @shops = is_public?(@shops)
	    @search_by = "service"
	  end
	end

	def show
		@shop = OnStoreUser.find(params[:id])
		@reviews = @shop.reviews.page(params[:page]).reverse_order
		@inquiries = Inquiry.where(user_id: current_user, on_store_user_id:  @shop.id)
	end

	private
	def search_params
    params.require(:q).permit(:major_category_name_or_name_or_minor_categories_name_cont)
  end

  # major_category(子), middle_category(孫), minor_category(ひ孫)から店舗(親)をキーワード検索
  # categoriesにはmiddle_categoryが入っている。
  # middle_categoryからみてmajor_category(親), minor_category(子)も含めたキーワード検索をransackで実行
  def store_sarch(categories)
  	# middle_categoryの重複除外
    def same_exclusion(sarch_middle_categories)
      middle_categories = []
      i = -1
      sarch_middle_categories.each do |sarch_middle_category|
      	# middle_categoryの重複除外
        if middle_categories[i] != sarch_middle_category
          i += 1
          middle_categories = middle_categories + [sarch_middle_category]
        end
      end
      return middle_categories
    end
    # on_store_userへ変換
    def convert_to_store(results_middle_categories)
      major_categories =[]
      on_store_users = []
      i = 0
      results_middle_categories.each do |results_middle_category|
      	# 代入されてるか？
        if major_categories.blank?
        	# 公開されているか？
          if results_middle_category.major_category.on_store_user.is_public == true
          	major_categories = major_categories + [results_middle_category.major_category]
	          on_store_users = on_store_users + [major_categories[i].on_store_user]
        	end
        else
        	# major_categoryの重複排除
	        if major_categories[i].id != results_middle_category.major_category_id
	        	# 公開されているか？
         		if results_middle_category.major_category.on_store_user.is_public == true
		          major_categories = major_categories + [results_middle_category.major_category]
		          i += 1
		          on_store_users = on_store_users + [major_categories[i].on_store_user]
		        end
	        end
	      end
      end
      return on_store_users
    end

    # middle_categoryの重複除外
    search_results = same_exclusion(categories)
    # on_store_userへ変換
    ground_results = convert_to_store(search_results)
  end

end

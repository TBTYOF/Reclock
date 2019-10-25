class OnStoreUserMailer < ApplicationMailer
	default from: 'welcome_stor_owner@reclock.work'

  def welcome_stor_owner
    @email = params[:email]
    mail(to: @email, subject: '出店希望者の方へ')
  end

  def new_inquiry
		on_store_user = params[:on_store_user]
		@inquiry = params[:inquiry]
		# テスト
		# @url = "http://localhost:3000/on_store_users/on_store_users/#{on_store_user.id}/inquiries"
		# デプロイ時はコメントアウトを外す
		@url = "http://reclock.work/on_store_users/on_store_users/#{on_store_user.id}/inquiries"
		mail(to: on_store_user.email, subject: '新着お問合せのお知らせ')
	end

	def new_reply
		@inquiry = params[:inquiry]
		@reply = params[:reply]
		# テスト
		# @url = "http://localhost:3000/on_store_users/on_store_users/#{@inquiry.on_store_user.id}/inquiries"
		# デプロイ時はコメントアウトを外す
		@url = "http://reclock.work/on_store_users/on_store_users/#{@inquiry.on_store_user.id}/inquiries"
		mail(to: @inquiry.on_store_user.email, subject: 'お問合せに返信が届いています')
	end

	def new_order
		@order = params[:order]
		# テスト
		# @order_index_url = "http://localhost:3000/on_store_users/on_store_users/#{@order.on_store_user.id}/orders"
		# @order_show_url = "http://localhost:3000/on_store_users/on_store_users/#{@order.on_store_user.id}/orders/#{@order.id}"
		# デプロイ時はコメントアウトを外す
		@order_index_url = "http://reclock.work/on_store_users/on_store_users/#{@order.on_store_user.id}/orders"
		@order_show_url = "http://reclock.work/on_store_users/on_store_users/#{@order.on_store_user.id}/orders/#{@order.id}"
		mail(to: @order.on_store_user.email, subject: '新規注文のお知らせ')
	end

	def update_order
		@order = params[:order]
		# テスト
		# @order_index_url = "http://localhost:3000/on_store_users/on_store_users/#{@order.on_store_user.id}/orders"
		# @order_show_url = "http://localhost:3000/on_store_users/on_store_users/#{@order.on_store_user.id}/orders/#{@order.id}"
		# デプロイ時はコメントアウトを外す
		@order_index_url = "http://reclock.work/on_store_users/on_store_users/#{@order.on_store_user.id}/orders"
		@order_show_url = "http://reclock.work/on_store_users/on_store_users/#{@order.on_store_user.id}/orders/#{@order.id}"
		mail(to: @order.on_store_user.email, subject: '支払方法更新のお知らせ')
	end

	def new_review
		@review = params[:review]
		# テスト
		# @url = "http://localhost:3000/on_store_users/on_store_users/#{@review.on_store_user.id}/reviews"
		# デプロイ時はコメントアウトを外す
		@url = "http://reclock.work/on_store_users/on_store_users/#{@review.on_store_user.id}/reviews"
		mail(to: @review.on_store_user.email, subject: 'レビュー投稿のお知らせ')
	end
end

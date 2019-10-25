class UserMailer < ApplicationMailer
	def new_inquiry
		user = params[:user]
		@inquiry = params[:inquiry]
		# テスト
		# @url = "http://localhost:3000/users/users/#{user.id}"
		# デプロイ時はコメントアウトを外す
		@url = "http://reclock.work/users/users/#{user.id}"
		mail(to: user.email, subject: '新着お問合せのお知らせ')
	end

	def new_reply
		@inquiry = params[:inquiry]
		@reply = params[:reply]
		# テスト
		# @url = "http://localhost:3000/users/users/#{@inquiry.user.id}"
		# デプロイ時はコメントアウトを外す
		@url = "http://reclock.work/users/users/#{@inquiry.user.id}"
		mail(to: @inquiry.user.email, subject: 'お問合せに返信が届いています')
	end

	def update_order
		@order = params[:order]
		# テスト
		# @url = "http://localhost:3000/users/users/#{@order.user.id}"
		# デプロイ時はコメントアウトを外す
		@url = "http://reclock.work/users/users/#{@inquiry.user.id}"
		mail(to: @order.user.email, subject: '修理状況が更新されました')
	end
end

class OnStoreUserMailer < ApplicationMailer
	default from: 'welcome_stor_owner@reclock.work'

  def welcome_stor_owner
    @email = params[:email]
    mail(to: @email, subject: '出店希望者の方へ')
  end
end

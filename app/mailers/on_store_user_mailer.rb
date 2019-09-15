class OnStoreUserMailer < ApplicationMailer
	default from: 'sing_up@reclock.com'

  def welcome_stor_owner
    @email = params[:email]
    mail(to: @email, subject: '出店希望者の方へ')
  end
end

class Users::UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to users_user_path(user)
  end

  def show
  end

  def home
  end

  def about
  end

  def withdrawal
  	
  end

  def quit
  	
  end

  private
  def user_params
    params.require(:user).permit(:name,
                                 :name_kana,
                                 :email,
                                 :telephone_number,
                                 :postcode,
                                 :address,
                                 :is_quit)
  end

end

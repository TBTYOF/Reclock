class Users::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:home, :about]
  # URL直入力弾く
  before_action :ensure_correct_user, except:[:home, :about]
  def ensure_correct_user
    if current_user.id != params[:id].to_i
      redirect_to root_path
    end
  end

  def edit
    @user = current_user
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to users_user_path(user)
  end

  def show
    @user = current_user
    @q = @user.inquiries.ransack(params[:q])
    @inquiries = @q.result(distinct: true).page(params[:page]).reverse_order
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

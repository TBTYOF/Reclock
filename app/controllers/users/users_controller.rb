class Users::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:home, :about]
  # URL直入力弾く
  before_action :ensure_correct_user, except:[:home, :about, :withdrawal]
  def ensure_correct_user
    if current_user.id != params[:id].to_i
      redirect_to root_path
    end
  end
  before_action :ensure_correct_user, only:[:withdrawal]
  def ensure_correct_user
    if current_user.id != params[:user_id].to_i
      redirect_to root_path
    end
  end

  def edit
    @user = current_user
    card = Card.where(user_id: @user.id).first
    if card.present?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_user_path(@user)
    else
      render :edit
    end
  end

  def show
    @user = current_user
    @q = @user.inquiries.ransack(params[:q])
    @inquiries = @q.result(distinct: true).page(params[:page]).reverse_order
    card = Card.where(user_id: @user.id).first
    if card.present?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def home
  end

  def about
  end

  def withdrawal
  end

  def destroy
    user = User.find(params[:id])
    user.is_quit = true
    user.save
    redirect_to users_logout_path
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

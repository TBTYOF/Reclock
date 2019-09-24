class OnStoreUsers::OnStoreUserImagesController < ApplicationController
	before_action :authenticate_on_store_user!
	# URLの直接入力を弾く
	before_action :ensure_correct_on_store_user
  def ensure_correct_on_store_user
    if current_on_store_user.id != params[:on_store_user_id].to_i
      redirect_to on_store_users_on_store_user_home_path(current_on_store_user)
    end
  end

	def destroy
		on_store_user_image = OnStoreUserImage.find(params[:id])
		on_store_user_image.destroy

		respond_to do |format|
	  	format.html
	  	format.js {render '/on_store_users/on_store_user_images/edit.js.erb'}
	  end
	end
end

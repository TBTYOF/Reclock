class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
    if resource.class == Admin
      admins_path
    elsif resource.class == User
      users_user_path(current_user)
    else
    	on_store_users_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :admin
      new_admin_session_path
    elsif resource == :user
      root_path
    else
    	new_on_store_user_session_path
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,
                                                       :name_kana,
                                                       :telephone_number,
                                                       :postcode,
                                                       :address,

                                                       :owner_name,
                                                       :owner_name_kana,
                                                       :shop_name
                                                      ])
  end
end

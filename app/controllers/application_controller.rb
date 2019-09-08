class ApplicationController < ActionController::Base

	def after_sign_in_path_for(resource)
    if resource.class == Admin
      admins_path
    elsif resource.class == User
      root_path
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
    	new_on_store_session_path
    end
  end
end

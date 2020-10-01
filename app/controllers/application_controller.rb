class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    # Log_in後に遷移するpath
    def after_sign_in_path_for(resource)
      case resource
      when Customer
        root_path
      when Admin
        admins_root_path
      end
    end
    # Sign_Up後に遷移するpath
    def after_sign_up_path_for(resource)
      case resource
      when Customer
        root_path
      when Admin
        admins_root_path
      end
    end

    #ログアウト後に遷移するpath
    def after_sign_out_path_for(resource_or_scope)
      return new_admin_session_path if resource_or_scope == :admin
    admin_root_path
  end

  	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :phone])
  	end

  end

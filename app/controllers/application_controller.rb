class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  # before_action :basic_auth, if: :production?

  # private

  # def production?
  #   Rails.env.production?
  # end

  # def basic_auth
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
  #   end
  # end

  # protect_from_forgery with: :exception
  


  # def after_sign_in_path_for(resource)
  #   case resource
  #   # when HostUser
  #   #   host_user_path(id: resource.id)
  #   when User
  #     user_path(id: resource.id)     
  #   end
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:nickname])
  end

  # def user_params
  #   params.require(:users).permit(user_id)
  # end

  # def host_user_params
  #   params.require(:host_users).permit(host_user_id)
  # end

  # def after_sign_out_path_for(resource_or_scope)
  #   root_path # ←redirect先にしたいpathを自分で書く
  # end

end

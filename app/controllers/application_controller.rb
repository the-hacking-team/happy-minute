class ApplicationController < ActionController::Base
  layout :layout_by_resource

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_location!, if: :storable_location?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password) }
  end

  private

  def layout_by_resource
    if devise_controller?
      'layouts/devise'
    else
      'layouts/application'
    end
  end

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_location!
    # :user is the scope we are authenticating
    store_location_for(:customer, request.fullpath)
    store_location_for(:owner, request.fullpath)
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end
end

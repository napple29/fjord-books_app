# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_account_update_parameters, if: :devise_controller?

  def configure_account_update_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:postal_code, :address, :self_introduction])
  end

  def after_sign_in_path_for(resource)
    "/books"
  end

  def after_sign_out_path_for(resource_or_scope)
    "/users/sign_in"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  before_action :authenticate_user!
end

# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  protected

  def after_update_path_for(_resource)
    users_show_path(current_user.id)
  end
end

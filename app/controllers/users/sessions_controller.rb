# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
    respond_with(resource, serialize_options(resource))
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  def destroy
    signed_out = sign_out(resource_name)
    set_flash_message! :notice, :signed_out if signed_out
    yield if block_given?
    respond_to_on_destroy
  end

  private

  def after_sign_in_path_for(resource_or_scope)
		stored_location_for(resource_or_scope) || signed_in_root_path(resource_or_scope)
  end

  def after_sign_out_path_for(_resource_or_scope)
    user_session_path
  end

  def sign_in_params
    devise_parameter_sanitizer.sanitize(:sign_in).slice(:email, :remember_me)
  end


end

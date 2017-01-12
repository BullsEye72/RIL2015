class Users::RegistrationsController < Devise::RegistrationsController

  # PUT /resource
  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)
    resource_updated = update_resource(resource, account_update_params)
    if resource_updated
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
            :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      bypass_sign_in resource, scope: resource_name
      redirect_to root_path
    else
      clean_up_passwords resource
      set_minimum_password_length
      render 'users/registrations/edit'
    end

  end

  def account_update_params
    devise_parameter_sanitizer.permit(
        :account_update,
        keys: [
            :firstname,
            :lastname,
            :adress,
            :phone_number,
            :email,
            :password,
            :password_confirmation,
            :current_password
        ]
    )
    devise_parameter_sanitizer.sanitize(:account_update)
  end

end

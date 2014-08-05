class NmsDevise::RegistrationsController < Devise::RegistrationsController

  protected

    def sign_up_params
        params.fetch(resource_name, {}).permit(:fname, :lname, :RIN, :email, :password, :password_confirmation, :is_active)
    end

end

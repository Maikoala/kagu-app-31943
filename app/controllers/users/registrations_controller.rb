class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname,
                                             :first_name,
                                             :last_name,
                                             :first_name_kana,
                                             :last_name_kana,
                                             :postal_code,
                                             :birthday])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: [:nickname,
                                             :first_name,
                                             :last_name,
                                             :first_name_kana,
                                             :last_name_kana,
                                             :postal_code,
                                             :birthday])
  end
end

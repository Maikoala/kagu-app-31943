class Owners::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:account_name,
                                             :first_name,
                                             :last_name,
                                             :first_name_kana,
                                             :last_name_kana,
                                             :postal_code,
                                             :state_province_id,
                                             :city,
                                             :address_line_1,
                                             :address_line_2,
                                             :phone_number,
                                             :birthday])
  end
end

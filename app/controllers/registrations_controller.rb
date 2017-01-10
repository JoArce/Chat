class RegistrationsController < Devise::RegistrationsController
 

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
    params.require(:user).permit(:username, :password, :email, :password_confirmation)
  end


end 
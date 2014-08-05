class RegistrationsController < Devise::RegistrationsController
 
  protected
 
  def account_update_params
    params.require(:user).permit(:avatar, :name, :email, :password, :password_confirmation, :current_password)
  end
end
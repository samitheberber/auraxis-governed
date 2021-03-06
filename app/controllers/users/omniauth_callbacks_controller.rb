class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :verify_authenticity_token
  def steam
    @user = User.find_for_steam_oauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "Steam") if is_navigational_format?
    else
      session["devise.steam_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end

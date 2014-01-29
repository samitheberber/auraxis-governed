class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :authenticate_user!

  check_authorization unless: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    if current_user.nil?
      session[:next] = request.fullpath
      redirect_to login_url, alert: "You have to log in to continue."
    else
      if request.env["HTTP_REFERER"].present?
        redirect_to :back, alert: exception.message
      else
        redirect_to root_url, alert: exception.message
      end
    end
  end
end

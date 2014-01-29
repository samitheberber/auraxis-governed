class WelcomeController < ApplicationController
  skip_authorization_check
  skip_before_filter :authenticate_user!

  def index
  end
end

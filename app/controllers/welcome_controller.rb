class WelcomeController < ApplicationController
  skip_authorization_check
  skip_before_filter :authenticate_user!

  def index
    @open_missions = Mission.free_to_join
  end
end

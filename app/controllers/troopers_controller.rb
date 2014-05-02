class TroopersController < ApplicationController

  authorize_resource

  def create
    trooper_params = params.require(:trooper).permit(:mission_id, character: [:name])
    mission = Mission.find trooper_params[:mission_id]
    mission.assign_trooper trooper_params[:character]
    redirect_to mission
  end
end

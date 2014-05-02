class MissionsController < ApplicationController
  authorize_resource

  before_action :set_mission, only: [:show, :destroy]
  before_action :set_servers, only: [:new, :create]

  def show
    @trooper = @mission.troopers.new
  end

  def new
    @mission = Mission.new
  end

  def create
    @mission = current_user.missions.new(mission_params)

    respond_to do |format|
      if @mission.save
        format.html { redirect_to @mission, notice: 'Mission was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mission }
      else
        format.html { render action: 'new' }
        format.json { render json: @mission.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @mission.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mission
      @mission = Mission.find(params[:id])
    end

    def set_servers
      @servers = PS.get_servers
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mission_params
      params.require(:mission).permit(:name, :status, :server, :faction)
    end
end

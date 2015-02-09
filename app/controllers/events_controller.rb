class EventsController < ApplicationController
  # set the vehicle instance for all actions
  before_action :set_vehicle

  #set the event instance for some actions
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  def index
    @vehicle = Vehicle.find(params[:vehicle_id])
    @events = @vehicle.events
  end

  def show
  end

private
  def set_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
  end
  def set_event
    logger.debug "invoking set_event"
    @event = @vehicle.events.find(params[:id])
  end
  def event_params
    params.require(:event).permit(:name)
  end

end


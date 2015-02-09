class EventsController < ApplicationController
  # set the vehicle instance for all actions
  before_action :set_vehicle

  #set the event instance for some actions
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  def index
    # @vehicle = Vehicle.find(params[:vehicle_id])
    @events = @vehicle.events
  end

  def new
    @event = @vehicle.events.new
  end

  def show
  end

  def create
    @event = @vehicle.events.new(event_params)
    if @event.save
      redirect_to vehicle_path(@vehicle)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to vehicle_path(@vehicle), notice: 'Event updated.'
    else
      render :edit
    end
  end

  def destroy
    @vehicle = @event.vehicle
    @event.destroy
      redirect_to @vehicle
  end

private
  def set_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
  end
  def set_event
    logger.debug "invoking set_event"
    @event = Event.find(params[:id])
  end
  def event_params
    params.require(:event).permit(:name)
  end

end


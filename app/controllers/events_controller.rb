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

    #GET the vendor id that we want to add to this event from the select dropdown in the form
    # @vendors = Vendor.all
    @vehicle.events.create(@event)
    @event.vendor = Vendor.find(params[:event][:vendor_id])
    if params[:event][:vendor_id].present?
    end

    if @event.save
      redirect_to vehicle_path(@vehicle) #redirect to vehicle show
      # redirect_to vehicles_path #redirect to vehicles index
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


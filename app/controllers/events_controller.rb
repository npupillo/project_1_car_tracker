# require 'pry-byebug'
class EventsController < ApplicationController
  # set the vehicle instance for all actions
  before_action :set_vehicle

  #set the event instance for some actions
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  def index
    @events = @vehicle.events
  end

  def new
    @event = @vehicle.events.new
  end

  def show
  end

  def create
    @event = @vehicle.events.new(event_params)
# binding.pry
    #GET the vendor_id & category_id from the select dropdowns in the form
    @event.vendor = Vendor.find(params[:event][:vendor_id])
    @event.category = Category.find(params[:event][:category_id])

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

  # Allow params for event and for vendor & category
  def event_params
    #Also whitelist the vendor & category attributes:
    params.require(:event).permit(:name, :vehicle, :vendor, :category, :cost, :event_date, :due_date, :notes,
      vendors_attributes: [:id, :name, :address, :phone, :website, :hours, :notes],
      categories_attributes: [:id, :name])
  end

end


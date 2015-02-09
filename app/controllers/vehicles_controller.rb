class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]

  def index
    @vehicles = Vehicle.all
  end

  def new
    @vehicle = Vehicle.new
  end

  def show
  end
  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
      redirect_to action: :index
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @vehicle.update(vehicle_params)
      redirect_to action: :show
    else
      render 'edit'
    end
  end

  def destroy
    @vehicle.destroy
    redirect_to action: :index
  end


  private
  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end
  def vehicle_params
    params.require(:vehicle).permit(:nickname, :make, :model, :year, :mileage, :purchase_date)
  end
end

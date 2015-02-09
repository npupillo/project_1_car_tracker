class VendorsController < ApplicationController
  # set the vendor instance for some actions
  before_action :set_vendor, only: [:edit, :update]
  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
      redirect_to action: :index
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @vendor.update(vendor_params)
      redirect_to action: :index
    else
      render 'edit'
    end
  end

private
  def set_vendor
    logger.debug "invoking set_event"
    @vendor = Vendor.find(params[:id])
  end
  def vendor_params
    params.require(:vendor).permit(:name, :address, :phone, :website, :hours)
  end
end


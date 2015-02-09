class CategoriesController < ApplicationController
  # set the category instance for some actions
  before_action :set_category, only: [:edit, :update]
  def index
    @categorys = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to action: :index
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to action: :index
    else
      render 'edit'
    end
  end

private
  def set_category
    logger.debug "invoking set_event"
    @category = Category.find(params[:id])
  end
  def category_params
    params.require(:category).permit(:name)
  end
end


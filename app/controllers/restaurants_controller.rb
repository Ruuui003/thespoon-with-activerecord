class RestaurantsController < ApplicationController
  # before_action :set_restaurant, except: [:index, :new, :create]
  before_action :set_restaurant, only: [:edit, :update, :destroy, :show]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    # params[:restaurant]
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy

    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    # params[:restaurant]
    params.require(:restaurant).permit(:name, :address, :rating)
  end
end
























class FlatsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  # def index
  #   @flats = Flat.all
  # end

  def index
    if params[:search]
      @flats = Flat.near(params[:search], 3)
      @markers = Gmaps4rails.build_markers(@flats) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
    end

    else
      @flats = Flat.find(:all)
    end
  end

  def show
    @flat = Flat.find(params[:id])
    @alert_message = "You are viewing #{@flat.title}"
  end

  def create
    @flat = current_user.flats.new(flat_params)

    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def new
    @flat = Flat.new
  end

  def update
    @flat = current_user.flats.find(params[:id])
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def edit
    @flat = current_user.flats.find(params[:id])
  end

  private

  def flat_params
    params.require(:flat).permit( :capacity, :address, :description, :picture, :latitude, :longitude, :title, :search, :user_id, :price)
  end
end







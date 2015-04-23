class FlatsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  # def index
  #   @flats = Flat.all
  # end

  def index
    if params[:search]
      @flats = Flat.where('city LIKE ?', params[:search])
    else
      @flats = Flat.find(:all)
    end
  end

  def show
    @flat = Flat.find(params[:id])

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
    params.require(:flat).permit( :capacity, :street, :zip_code, :city, :description, :picture, :search, :user_id, :price)
  end
end







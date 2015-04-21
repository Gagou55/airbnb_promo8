class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def create
    @flat = Flat.new(flat_params)
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

  end

  def edit
  end

  private

  def flat_params
    params.require(:flat).permit( :capacity, :street, :zip_code, :city, :description)
  end

end







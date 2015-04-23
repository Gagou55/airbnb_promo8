class ReservationsController < ApplicationController
  def show
    @reservation = Reservation.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    flat = Flat.find(params[:flat_id])
    @reservation = @user.Reservation.build(flat: flat).save!
    @reservation.save
  end

  def new
    @reservation = Reservation.new
  end
end





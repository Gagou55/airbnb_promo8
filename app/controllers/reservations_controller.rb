class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def show
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)

    @flat = Flat.find(params[:flat_id])
    @reservation.flat_id = @flat.id

    if @reservation.save
      @reservation.validation = true
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @reservation = Reservation.new
  end

  private

  def reservation_params
    params.require(:reservation).permit(:begin_date, :end_date, :validation)
  end
end

    # @user = User.new(params[:user])
    # flat = Flat.find(params[:flat_id])
    # @reservation = @user.reservation.build(flat: flat).save!
    # @reservation.save
    # redirect_to flat_reservations_path(@reservation)



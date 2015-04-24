class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:flat_id]
      @reservations = Reservation.find(flat_id: params[:flat_id])
    else
      @reservations = current_user.reservations
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)

    @flat = Flat.find(params[:flat_id])
    @reservation.flat_id = @flat.id

    if @reservation.save
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
    params.require(:reservation).permit(:id, :begin_date, :end_date)
  end
end

    # @user = User.new(params[:user])
    # flat = Flat.find(params[:flat_id])
    # @reservation = @user.reservation.build(flat: flat).save!
    # @reservation.save
    # redirect_to flat_reservations_path(@reservation)



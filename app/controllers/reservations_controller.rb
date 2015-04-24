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

  def create # Demande de reservation par un locataire
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.validation = false
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

  def update # confirmation par un proprio (owner)
    @reservation = Reservation.find(params[:id]) # la route flats/flat_id/reservations/reservation_id

    if @reservation.user == current_user || @reservation.flat.user == current_user
      @reservation.update_attributes(update_reservation_params)
      @reservation.save
    end
  end

  private
  def update_reservation_params
    params.require(:reservation).permit(:validation)
  end

  def reservation_params
    params.require(:reservation).permit(:id, :begin_date, :end_date, :validation)
  end
end

    # @user = User.new(params[:user])
    # flat = Flat.find(params[:flat_id])
    # @reservation = @user.reservation.build(flat: flat).save!
    # @reservation.save
    # redirect_to flat_reservations_path(@reservation)



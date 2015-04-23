class ReservationsController < ApplicationController
  def show
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @flat = Flat.find(params[:flat_id])
    @reservation.flat_id = @flat.id
    @user = User.new(params[:user])
    if @reservation.save
      redirect_to user_path(current_user[:id])
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
    params.require(:reservation).permit(:begin_date, :end_date, :flat_id, :user_id)
  end
end

    # @user = User.new(params[:user])
    # flat = Flat.find(params[:flat_id])
    # @reservation = @user.reservation.build(flat: flat).save!
    # @reservation.save
    # redirect_to flat_reservations_path(@reservation)



class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def new
  	@reservation = Reservation.new
  end

  def create
  	@reservation = Reservation.new reservation_params
    @reservation.user_id = current_user.id

    if @reservation.save
    	redirect_to reservations_path, :notice => "Reservation Made"
    else
      render :action => :new
    end
  end

  protected

  def reservation_params
  	params.require(:reservation).permit(:start_at, :end_at)
  end

end

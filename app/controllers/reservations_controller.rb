class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def new
  	@reservation = Reservation.new
    @reservation.start_at_date = Time.zone.now.to_date.to_s

    @reservation.end_at_date = Time.zone.now.to_date.to_s
    @reservation.end_at_time = (Time.zone.now + 2.hour).strftime("%H:%M")
  end

  def create
  	@reservation = Reservation.new reservation_params
    @reservation.user_id = current_user.id

    if @reservation.save
    	redirect_to reservations_path, :notice => "Reservation Made"
    else
      render :action => :new, :notice => "Reservation not possible"
    end
  end

  protected

  def reservation_params
  	params.require(:reservation).permit(:start_at_date, :start_at_time, :end_at_date, :end_at_time)
  end

end

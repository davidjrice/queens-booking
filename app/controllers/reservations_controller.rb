class Time

  # def round_off(seconds = 60)
   # Time.at((self.to_f / seconds).round * seconds)
 # end

end

class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def new
  	@reservation = Reservation.new
    @reservation.start_at_date = Time.zone.now.to_date.to_s
    @reservation.start_at_time = (Time.zone.now).strftime("%H:%M")

    @reservation.end_at_date = Time.zone.now.to_date.to_s
    @reservation.end_at_time = (Time.zone.now.round_off + 0.5.hour).strftime("%H:%M")

    # adding validation so that times in the past cannot be selected for reservation start times
    if @reservation.start_at_time < Time.zone.now
      render :action => :new, :notice => "Start time must not be in the past"
    end
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

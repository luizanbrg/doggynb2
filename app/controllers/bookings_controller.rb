class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = current_user.bookings.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.dog = Dog.find(params[:dog_id])
    @booking.user = current_user
    if @booking.save!
      redirect_to dogs_path
    else
      render 'dogs/show', status: :unprocessable_entity
    end
  end

  private

def booking_params
  params.require(:booking).permit(:start_date, :end_date)
end
end

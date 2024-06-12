class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :index]
  def index
   @bookings = Booking.where(user_id:current_user)
  end

  def show
    @booking = Booking.where(user_id:current_user)

  end

  def create
    @booking = Booking.new(booking_params)
    @booking.dog = Dog.find(params[:dog_id])
    @booking.user = current_user
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render 'dogs/show', status: :unprocessable_entity
    end
  end

  private

def booking_params
  params.require(:booking).permit(:start_date, :end_date)
end
end

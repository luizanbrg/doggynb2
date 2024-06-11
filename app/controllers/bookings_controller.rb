class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = current_user.bookings.find(params[:id])
  end

end

class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.where(user_id:current_user)

  end

end

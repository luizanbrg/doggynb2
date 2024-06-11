class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
    @bookings = current_user.bookings
  end

  def show
raise
    @booking = current_user.booking.find(params[:id])
  end

end


class DogsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    if params[:query].present?
      @dogs = Dog.where('name ILIKE ?', "%#{params[:query]}%")
    else
      @dogs = []
    end
    @all_dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
    @booking = Booking.new
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    if @dog.save
      redirect_to dog_path(@dog)
    else
      render 'dogs/new', status: :unprocessable_entity
    end
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    @dog.update(dog_params)
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy
  end

private

def dog_params
  params.require(:dog).permit(:name, :description, :breed, :city, :start_date, :end_date, :photo)
end

end

class DogsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    if params[:query].present?
      @dogs = Dog.where('name ILIKE ?', "%#{params[:query]}%")
    else
      @dogs = []
    end
    @all_dogs = Dog.all
    @mapbox_access_token = ENV.fetch('MAPBOX_API_KEY')
    @markers = @all_dogs.geocoded.map do |dog|
    {
      lat: dog.latitude,
      lng: dog.longitude
    }
  end
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
    if @dog.save
      redirect_to dog_path(@dog), notice: "Le profil a été édité avec succès."
    else
      render 'dogs/edit', status: :unprocessable_entity
    end
  end


  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy
    redirect_to dogs_path, status: :see_other
  end

private

def dog_params
  params.require(:dog).permit(:name, :description, :breed, :city, :start_date, :end_date, :photo)
end

end

class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    @dog.update(dog_params)
  end

  def delete
    @dog = Dog.find(params[:id])
    @dog.destroy
  end

private

def dog_params
  params.require(:dog).permit(:name, :description, :breed, :city, :start_date, :end_date)
end
end

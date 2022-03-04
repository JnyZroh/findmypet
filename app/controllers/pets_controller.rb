class PetsController < ApplicationController
  def new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user

    if @pet.save
      redirect_to poster_confirm_path(@pet.posters.last)
    else
      render 'posters/new'
    end
  end

  def update
  end

  def my_pets
  end

  def destroy
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :species, :breed, :color, photos: [], posters_attributes: %i[date_missing address])
  end
end

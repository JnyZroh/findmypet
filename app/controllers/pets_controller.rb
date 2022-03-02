class PetsController < ApplicationController
  def new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = User.first

    if @pet.save!
      redirect_to poster_confirm_path(@pet.posters.last)
    else
      render 'posters/new'
    end
  end

  def my_pets
  end

  def destroy
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :species, :breed, :color, posters_attributes: %i[date_missing address])
  end
end

class PostersController < ApplicationController
  def new
    @pet = Pet.new
    @pet.posters.build unless @pet.posters.any?
  end

  def edit
    @poster = Poster.find(params[:id])
  end

  def update
    @poster = Poster.find(params[:id])
    @poster.pet.user = current_user
    if @poster.update!(poster_params)
      redirect_to poster_path(@poster)
    else
      render 'edit'
    end
  end

  def create
  end

  def show
    @poster = Poster.find(params[:id])
  end

  def print
  end

  def mark_as_found
  end

  def index
    @pets = Bestfriend.all
    @markers = @pets.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def confirm
    @poster = Poster.find(params[:poster_id])
  end

  private

  def poster_params
    params.require(:poster).permit(:date_missing, :address, pet_attributes: [:name, :species, :breed, :color, :id, photos: []])
  end
end

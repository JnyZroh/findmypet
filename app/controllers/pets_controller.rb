class PetsController < ApplicationController
  def index
    @reports = Report.all
    @markers = []

    @reports.each do |report|
      @markers << {
        lat: report.latitude,
        lng: report.longitude,
        info_window: render_to_string(partial: "info_window_report", locals: { report: report }),
        image_url: helpers.asset_url("reporticon.png")
      }
    end

    @posters = Poster.all

    @posters.each do |poster|
      @markers << {
        lat: poster.latitude,
        lng: poster.longitude,
        info_window: render_to_string(partial: "info_window_poster", locals: { poster: poster }),
        image_url: helpers.asset_url("peticon.png")
      }
    end
  end

  def new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user

    if @pet.save
      @poster = @pet.posters.last
      @poster.address = @poster.address.gsub(/ \w\d\w \d\w\d,/, "")
      @poster.save
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

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

    @markers =
    [{
      lat: @poster.latitude,
      lng: @poster.longitude,
      info_window: render_to_string(partial: "info_window", locals: { poster: @poster }),
      image_url: helpers.asset_url("peticon.png")
      }]
    # #@markers = @poster.geocoded.map do |poster|
    #   {
    #     lat: poster.latitude,
    #     lng: poster.longitude
    #   }
    # end

  end

  def print
    @poster = Poster.find(params[:poster_id])

    respond_to do |format|
      format.html
      format.pdf do
        pdf = PosterPdf.new(@poster)
        send_data pdf.render, filename: "missing_pet_#{@poster.pet.name}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end

  end

  def mark_as_found
    @poster = Poster.find(params[:poster_id])
    @poster.found = true
    @poster.date_found = Date.today
    @poster.save
  end

  def index
  end

  def confirm
    @poster = Poster.find(params[:poster_id])
  end

  private

  def poster_params
    params.require(:poster).permit(:date_missing, :address, :comment, pet_attributes: [:name, :species, :breed, :color, :id, photos: []])
  end
end

class PostersController < ApplicationController
  def new
    @pet = Pet.new
    @pet.posters.build
  end

  def create
  end

  def show
  end

  def print
  end

  def mark_as_found
  end

  def index
  end

  def confirm
    @poster = Poster.find(params[:poster_id])
  end
end

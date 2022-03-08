class PagesController < ApplicationController
  def home
    @posters = Poster.all
    @reports = Report.all
  end
end

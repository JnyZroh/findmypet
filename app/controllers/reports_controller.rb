class ReportsController < ApplicationController
  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.user = current_user
    if @report.save!
      redirect_to report_path(@report)
    else
      render :new
    end
  end

  def index
  end

  def show
    @report = Report.find(params[:id])
    @posters = Poster.all
    @nearby = Poster.near([@report.latitude, @report.longitude], 2, :units => :km, :order => :distance)
  end

  def edit
  end

  def update
  end

  private

  def report_params
    params.require(:report).permit(:report_type, :species, :color, :date_spotted, :address, :description, photos: [])
  end

end

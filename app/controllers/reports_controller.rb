class ReportsController < ApplicationController
  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.user = current_user
    if @report.save!
      @report.address = @report.address.gsub(/ \w\d\w \d\w\d,/, "")
      @report.save
      redirect_to report_confirm_path(@report)
    else
      render :new
    end
  end

  def index
  end

  def show
    @report = Report.find(params[:id])
    @markers =
    [{
      lat: @report.latitude,
      lng: @report.longitude,
      info_window: render_to_string(partial: "pets/info_window_report", locals: { report: @report }),
          image_url: helpers.asset_url("reporticon.png")
    }]


  end

  def edit
  end

  def update
  end

  def confirm
    @report = Report.find(params[:report_id])
    @posters = Poster.all
    @nearby = Poster.near([@report.latitude, @report.longitude], 2, :units => :km, :order => :distance)
  end

  private

  def report_params
    params.require(:report).permit(:report_type, :species, :color, :date_spotted, :address, :description, photos: [])
  end

end

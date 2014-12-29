class WeathersController < ApplicationController
  def new
    @weather = Weather.new
  end

  def index
    @weathers = Weather.all
  end

  def show
    @weather = Weather.find(params[:id])
  end

  def create
    @weather = Weather.new(weather_params)
    if @weather.save
      redirect_to weathers_path, notice: "New weather successfully submitted"
    else
      render :new
    end
  end

  private
  def weather_params
    params.require(:weather).permit(:city, :state, :date, :conditions, :feel)
  end
end

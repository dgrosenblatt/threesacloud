class WeathersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @weather = Weather.new
  end

  def index
    @weathers = Weather.all
  end

  def show
    @weather = Weather.find(params[:id])
    @review = Review.new
    @vote = Vote.new
  end

  def create
    @weather = Weather.new(weather_params)
    @weather.user = current_user
    @weather.date = Date.today
    if @weather.errors?
      flash.now[:notice] = "Something went wrong with your request. Please check city and state."
      render :new
    else
      @weather.from_api
      if @weather.save
        redirect_to weathers_path, notice: "New weather successfully submitted"
      else
        render :new
      end
    end
  end

  def edit
    @weather = Weather.find(params[:id])
  end

  def update
    @weather = Weather.find(params[:id])
    @weather.user = current_user
    if @weather.update(weather_params)
      redirect_to weather_path(@weather), notice: "Weather successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @weather = Weather.find(params[:id])
    if current_user.admin? || @weather.user == current_user
      @weather.destroy
      redirect_to weathers_path, notice: "Weather successfully deleted"
    else
      redirect_to @weather
    end
  end

  private
  def weather_params
    params.require(:weather).permit(:city, :state, :date, :conditions, :feel)
  end
end

class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.weather_id = params[:weather_id]
    @weather = Weather.find(@review.weather_id)

    if @review.save
      # email generated here?
      @user = User.find(@weather.user_id)
      UserMailer.review_alert(@user).deliver
      # binding.pry

      redirect_to @review.weather, notice: "Your review has been posted"
    else
      render "weathers/show"
    end
  end

  def edit
    @review = Review.find(params[:id])
    @weather = Weather.find(@review.weather_id)
  end

  def update
    @review = Review.find(params[:id])
    @weather = Weather.find(@review.weather_id)
    if @review.update(review_params)
      redirect_to @weather, notice: "Review successfully updated "
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @weather = Weather.find(@review.weather_id)
    if current_user == @review.user || current_user.admin?
      @review.destroy
      redirect_to @weather, notice: "Review successfully deleted"
    else
      redirect_to @weather
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

end

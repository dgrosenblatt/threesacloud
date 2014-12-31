class ReviewsController < ApplicationController
  
  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.weather_id = params[:weather_id]
    @weather = Weather.find(@review.weather_id)
    if @review.save      
      redirect_to @review.weather, notice: "Your review has been posted"
    else
      render "weathers/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

end

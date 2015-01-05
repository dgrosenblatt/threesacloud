class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @vote = Vote.new(choice: params[:vote][:choice])
    @vote.user = current_user
    @vote.review_id = params[:review_id]
    @vote.save
    redirect_to @vote.review.weather, notice: "Thank you for voting."
  end

  def update
  end

  def destroy
    @vote = Vote.find(params[:id])
    @weather = @vote.review.weather

    if @vote.user == current_user
      @vote.destroy
      redirect_to @weather, notice: "Vote Deleted"
    else
      redirect_to @weather
    end
  end

end

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
    @vote = Vote.find(params[:id])
    @weather = @vote.review.weather
    if @vote.user != current_user
      redirect_to @weather
    end
    
    if @vote.choice == "up"
      @vote.choice = "down"
    else
      @vote.choice = "up"
    end

    if @vote.save
      redirect_to @weather, notice: "Vote Changed"
    else
      redirect_to @weather
    end
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

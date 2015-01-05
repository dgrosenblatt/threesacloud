class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = Review.find(params[:review_id])
    @vote = @review.votes.build(vote_params)
    @vote.user = current_user
    if @vote.save
      redirect_to @vote.review.weather, notice: "Thank you for voting."
    else
      flash[:notice] = "You have already voted on that review"
      redirect_to @vote.review.weather
    end
  end

  def update
    @vote = Vote.find(params[:id])
    @weather = @vote.review.weather
    redirect_to @weather if @vote.user != current_user
    @vote.choice == "up" ? choice = "down" : choice = "up"
    flash[:notice] = "Vote Changed" if @vote.update_attributes(choice: choice)
    redirect_to @weather
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

  private

  def vote_params
    params.require(:vote).permit(:user_id, :review_id, :choice)
  end
end

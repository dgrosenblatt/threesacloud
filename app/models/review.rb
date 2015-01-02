class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :weather
  has_many   :votes

  validates :comment, presence: true
  validates :rating, presence: true

  def upvotes
    votes.where(choice: "up").length
  end

  def downvotes
    votes.where(choice: "down").length
  end

  def voted?
    votes.where(user_id: current_user.id).any?
  end

end

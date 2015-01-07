class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :weather
  has_many :votes

  validates :comment, presence: true
  validates :rating, presence: true

  paginates_per 10

  def upvotes
    votes.where(choice: "up").length
  end

  def downvotes
    votes.where(choice: "down").length
  end
end

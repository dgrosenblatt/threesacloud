class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :weather

  validates :comment, presence: true
  validates :rating, presence: true



end

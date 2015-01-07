class Weather < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  paginates_per 6
end

class Weather < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  paginates_per 6

  def self.search(search)
      @weathers = Weather.where('city LIKE ?', "%#{search}%")
  end
end

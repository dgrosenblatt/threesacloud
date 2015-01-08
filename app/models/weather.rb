class Weather < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  paginates_per 6

  def self.search(search)
      @weathers = Weather.where('city LIKE ?', "%#{search}%")
  end

  validates :city, presence: true
  validates :state, presence: true

  def connect_api
    query = "http://api.wunderground.com/api/#{ENV["WEATHER_API"]}/conditions/q/#{self.state}/#{self.city}.json"
    @result = JSON.parse(Net::HTTP.get(URI.parse(URI.escape(query))))
  end

  def errors?
    connect_api["response"]["error"] != nil || connect_api["response"]["results"] != nil
  end

  def from_api
    current_weather = connect_api["current_observation"]
    self.feel = current_weather["feelslike_string"]
    self.conditions = current_weather["weather"]
    self.icon_url = current_weather["icon_url"]
  end
end

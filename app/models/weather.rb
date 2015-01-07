class Weather < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  def from_api
    query = "http://api.wunderground.com/api/#{ENV["WEATHER_API"]}/conditions/q/#{self.state}/#{self.city}.json"
    @result = JSON.parse(Net::HTTP.get(URI.parse(URI.escape(query))))
    self.feel = @result["current_observation"]["feelslike_string"]
    self.conditions = @result["current_observation"]["weather"]
    self.icon_url = @result["current_observation"]["icon_url"]
  end

end

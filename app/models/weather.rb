class Weather < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  def get_api
    query = "http://api.wunderground.com/api/#{ENV["WEATHER_API"]}/conditions/q/#{self.state}/#{self.city}.json"
    @result = JSON.parse(Net::HTTP.get(URI.parse(URI.escape(query))))
  end

  def get_feel
    self.feel = get_api["current_observation"]["feelslike_string"]
  end

  def get_conditions
    self.conditions = get_api["current_observation"]["weather"]
  end


end

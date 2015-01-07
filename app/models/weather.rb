class Weather < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  def self.search(search)
    if search
      @weathers = Weather.where('city LIKE ?', "%#{search}%")
    else
      @weathers = Weather.all
    end
    @weathers
  end
end

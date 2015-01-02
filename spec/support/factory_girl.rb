require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :weather do
    city 'Boston'
    state 'MA'
    date { Time.now }
    conditions 'Cloudy'
    feel 'Cold'
  end

  factory :review do
    comment 'Nice weather'
    rating 5
    weather
    user
  end

end

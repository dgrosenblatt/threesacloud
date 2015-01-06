require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'

  end

  factory :weather do
    sequence(:city) {|n| "#{n}Boston" }
    state 'MA'
    date { Time.now }
    conditions 'Cloudy'
    feel 'Cold'
  end

  factory :review do
    sequence(:comment) {|n| "#{n}comment" }
    rating 5
    weather
    user
  end

end

require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    role "member"

  end

  factory :weather do
    sequence(:city) { |n| "#{n}Boston" }
    state 'MA'
    date { Time.now }
    conditions 'Cloudy'
    feel 'Cold'
    user
  end

  factory :review do
    sequence(:comment) { |n| "#{n}n addition, we’ve added a Git version warning in Toolbelt that will prompt you to update Git if you’re using a vulnerable version on Windows (shown here) or OS X:" }
    rating 5
    weather
    user
  end

end

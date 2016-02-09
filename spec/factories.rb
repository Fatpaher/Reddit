FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password "12345678"
    password_confirmation "12345678"
  end

  factory :link do
    title Faker::Name.title
    url Faker::Internet.url
    user_id 1
  end

  factory :comment do
    link_id 1
    user_id 1
    body Faker::Hacker.say_something_smart
  end
end

FactoryGirl.define do
  factory :user do
    email "douglas@example.com"
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now
    end
  end
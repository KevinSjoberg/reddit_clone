FactoryGirl.define do
  factory :user do
    email {|n| "user#{n}@example.com" }
    password "password1"
    password_confirmation "password1"
  end
end

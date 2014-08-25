FactoryGirl.define do
  factory :user do
    name     "Paul Adamson"
    email    "paul@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end

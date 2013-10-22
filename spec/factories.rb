FactoryGirl.define do
  factory :user do
    name     "free"
    role     "admin"
    password "111111111"
    password_confirmation "111111111"
  end
end
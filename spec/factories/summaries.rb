# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :summary do
    user_id 1
    day_id 1
    content "MyText"
  end
end

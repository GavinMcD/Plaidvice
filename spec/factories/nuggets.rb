# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :nugget do
    audience "MyString"
    topic "MyString"
    body "MyText"
    user_id 1
  end
end

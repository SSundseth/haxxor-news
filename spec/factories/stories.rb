# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :story do
    title "Title"
    url "http://url.com"
    user_id 1
  end
end

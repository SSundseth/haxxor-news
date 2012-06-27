# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vote do
    votable { FactoryGirl.create(:story) }
    score 1
    user { FactoryGirl.create(:user) }
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    commentable { FactoryGirl.create(:top_comment) }
    body "lol"
    user { FactoryGirl.create(:user) }

    factory :top_comment do
      commentable { FactoryGirl.create(:story) }
      body "wut"
      user { FactoryGirl.create(:user) }
    end
  end

end

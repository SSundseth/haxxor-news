# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    commentable { FactoryGirl.create(:story) }
    body "lol"
    user { FactoryGirl.create(:user) }

    factory :comment_child do
      commentable { FactoryGirl.create(:comment) }
    end
  end

end

FactoryGirl.define do
  factory :bob do
    email "user@email.com"
    password "pass"
    confirmation_token "foo"
  end
end

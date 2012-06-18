FactoryGirl.define do
  factory :user do
    email "user@email.com"
    password "pass"
  end

  factory :badpass do
    email "user@email.com"
    password "bad"
  end

  factory :baduser do
    email "bad@email.com"
    password "pass"
  end

  factory :noemail do
    password "pass"
  end

  factory :nopass do
    email "user@email.com"
  end
end

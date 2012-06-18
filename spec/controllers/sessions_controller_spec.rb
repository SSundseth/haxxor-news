require 'spec_helper'

describe Clearance::SessionsController do

  user { FactoryGirl.create(:user) }
  user.save

  it 'requires correct password' do
    subject { FactoryGirl.create(:badpass) }
    test_auth = authenticate(subject)
    test_auth.should be_nil
  end

  it 'requires existing user' do
    subject { FactoryGirl.create(:baduser) }
    test_auth = authenticate(subject)
    test_auth.should be_nil
  end

  it 'authenticates' do
    test_auth = authenticate(user)
    test_auth.should_not be_nil
  end
end

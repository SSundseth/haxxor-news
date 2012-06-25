require 'spec_helper'

describe Clearance::SessionsController do

  it 'requires correct password' do
    User.authenticate("user@email.com", "badpass").should be_nil
  end

  it 'requires existing user' do
    User.authenticate("notsaved@email.com", "pass").should be_nil
  end

  it 'authenticates' do
    user = FactoryGirl.create(:user)
    User.authenticate("user1@email.com", "pass").should_not be_nil
  end
end

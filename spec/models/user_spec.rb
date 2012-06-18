require 'spec_helper'

describe User do
  
  subject { FactoryGirl.create(:user) }

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

end


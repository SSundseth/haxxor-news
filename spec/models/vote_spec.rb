require 'spec_helper'

describe Vote do
  subject { FactoryGirl.create(:vote) }

  describe "validations" do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:votable) }
    it { should validate_presence_of(:score) }
    it { should allow_value(1).for(:score) }
    it { should allow_value(-1).for(:score) }
  end

end

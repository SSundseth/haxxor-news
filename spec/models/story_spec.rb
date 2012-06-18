require 'spec_helper'

describe Story do

  subject { FactoryGirl.create(:story) }

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:url) }
  end

  it 'should begin with http:// or http://' do
    subject = FactoryGirl.build(:story, :url => 'url.com')
    subject.should be_invalid
    subject.errors[:url].should == ["must begin with http:// or https://"]
  end
end



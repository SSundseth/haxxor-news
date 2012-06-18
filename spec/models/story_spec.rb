require 'spec_helper'

describe Story do

  subject { FactoryGirl.create(:story) }

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:url) }
  end

  it 'url should begin with http://' do
    subject = described_class.new(:url => 'url.com', :title => 'title')
    subject.should be_invalid
    subject.errors[:url].should == ["is invalid"]
  end
end



require 'spec_helper'

describe Story do
  it 'requires title' do
    subject = described_class.new(:url => 'specurl.com')
    subject.should be_invalid
    subject.errors[:title].should == ["can't be blank"]
  end

  it 'requires url' do
    subject = described_class.new(:title => 'Title')
    subject.should be_invalid
    subject.errors[:url].should == ["can't be blank", "is invalid"]
  end

  it 'url should begin with http://' do
    subject = described_class.new(:url => 'url.com', :title => 'title')
    subject.should be_invalid
    subject.errors[:url].should == ["is invalid"]
  end


  it 'is valid if title and url are present' do
    subject = described_class.new(:url => 'http://url.com', :title => 'title')
    subject.should be_valid
  end
end



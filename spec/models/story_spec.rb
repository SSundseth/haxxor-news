require 'spec_helper'

describe Story do
  it 'requires title' do
    story = Story.new(:url => 'specurl.com')
    story.should be_invalid
    story.errors[:title].should == ["can't be blank"]
  end

  it 'requires url' do
    story = Story.new(:title => 'Title')
    story.should be_invalid
    story.errors[:url].should == ["can't be blank"]
  end

  it 'is valid if title and url are present' do
    story = Story.new(:url => 'url.com', :title => 'title')
    story.should be_valid
  end
end



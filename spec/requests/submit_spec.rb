require 'spec_helper'

describe "submit" do
  
  before do
    sign_up_helper
  end

  it 'lets a user post a story' do
    click_link "submit"
    current_path.should == "/stories/new"
    fill_in "Title", :with => "Title"
    fill_in "Url", :with => "http://title.com"
    click_button "Create"
    current_path.should == "/stories"
    page.should have_content "Title"
    find_link("Title").should be_visible
  end

  it 'does not post an invalid story' do
    visit 'stories/new'
    fill_in 'Title', :with => 'Title'
    fill_in 'Url', :with => 'notvalid.com'
    click_button "Create"
    page.should have_content 'Url must begin with http:// or https://'
  end
end

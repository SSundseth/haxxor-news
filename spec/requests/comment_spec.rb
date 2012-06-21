require 'spec_helper'

describe "comment" do
  before do
    sign_up_helper
    post_story
  end

  it 'lets a user comment' do
    click_link "comments"
     #print page.html
    page.should have_content "Add a Comment:"
    fill_in "comment_body", :with => "This is a comment"
    click_button "Post Comment"
    page.should have_content "This is a comment"
  end
end

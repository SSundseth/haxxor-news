require 'spec_helper'

describe "comment" do
  before do
    sign_up_helper
    post_story
  end

  it 'lets a user comment' do
    click_link "comments"
    page.should have_content "Add a Comment:"
    post_comment
    page.should have_content "This is a comment"
  end
  it 'does not post an invalid comment' do
    click_link 'comments'
    click_button "Post Comment"
    page.should have_content "Comment cannot be blank"
  end

  it 'lets a user reply to a comment' do
    click_link "comments"
    post_comment
    click_link "reply"
    fill_in "comment_body", :with => "This is a reply"
    click_button "Post Comment"
    page.should have_content "This is a reply"
  end
end

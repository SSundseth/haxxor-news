require 'spec_helper'

describe "vote" do
  before do
    sign_up_helper
    post_story
  end

  it "lets a user vote on a story" do
    click_link "Up"
    page.should have_content "1 points"
  end

  it "lets a user vote on a comment" do
    click_link "comments"
    post_comment
    click_link "Down"
    page.should have_content "-1 points"
  end
end


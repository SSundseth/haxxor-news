require "spec_helper"

describe "home" do

  before do
    visit "/"
  end

  it "Has 'sign up' and 'login' links" do
    find_link("Sign Up").should be_visible
    find_link("Login").should be_visible
    find_link("Haxxor News").should be_visible
  end

  it "Lets a visitor sign up" do
    click_link "Sign Up"
    current_path.should == "/sign_up"
    fill_in "Email", :with => "example@email.com"
    fill_in "Password", :with => "pass"
    click_button "Sign up"
    current_path.should == root_path
    find_link("submit").should be_visible
  end

  it "Lets a user login" do
    click_link "Login"
    current_path.should == "/sign_in"
    fill_in "Email", :with => "example@email.com"
    fill_in "Password", :with => "pass"
    click_button "Sign in"
    current_path.should == "/session"
  end

end
require 'rails_helper'

describe "Author creation page", :type => :feature do

  it "should display 'New author'" do
    visit '/authors/new'
    expect(page).to have_text("New author")
  end

  it "should have a 'first name' field" do
    visit '/authors/new'
    expect(page).to have_text("First name")
  end

  it "should have a 'last name' field" do
    visit '/authors/new'
    expect(page).to have_text("Last name")
  end

  it "should have a 'homepage' field" do
    visit '/authors/new'
    expect(page).to have_text("Homepage")
  end
end
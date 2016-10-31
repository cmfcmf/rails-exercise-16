require 'rails_helper'

describe "Author creation page", :type => :feature do

  it "should display 'Create author'" do
    visit '/authors/new'
    expect(page).to have_text("Create author")
  end
end
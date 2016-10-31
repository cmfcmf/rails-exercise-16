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

  it "should have a submit button" do
    visit '/authors/new'
    expect(page.find_button("Create Author").value).to eq("Create Author")
  end

  it "should create new author instances" do
    visit '/authors/new'
    fill_in('First name', with: 'Alan')
    fill_in('Last name', with: 'Turing')
    fill_in('Homepage', with: 'http://wikipedia.org/Alan_Turing')
    click_button('Create Author')

    expect(Author.where(first_name: 'Alan', last_name: 'Turing', homepage: 'http://wikipedia.org/Alan_Turing')).to exist
  end
end
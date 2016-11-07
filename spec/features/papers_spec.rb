require 'rails_helper'

describe "Paper creation page", :type => :feature do
  before :each do
    create(:author)
  end

  it "should display 'New paper'" do
    visit '/authors/1/papers/new'
    expect(page).to have_text("New paper")
  end

  it "should display validation errors" do
    visit '/authors/1/papers/new'

    click_button('Create Paper')

    expect(page).to have_text("Title can't be blank")
  end

  it "should have a 'title' field" do
    visit '/authors/1/papers/new'
    expect(page).to have_text("Title")
  end

  it "should have a 'venue' field" do
    visit '/authors/1/papers/new'
    expect(page).to have_text("Venue")
  end

  it "should have a 'year' field" do
    visit '/authors/1/papers/new'
    expect(page).to have_text("Year")
  end

  it "should have a submit button" do
    visit '/authors/1/papers/new'
    expect(page.find_button("Create Paper").value).to eq("Create Paper")
  end

  it "should create new paper instances" do
    visit '/authors/1/papers/new'
    fill_in('Title', with: 'My Paper')
    fill_in('Venue', with: 'HPI')
    fill_in('Year', with: 2016)
    click_button('Create Paper')

    expect(Paper.where(title: 'My Paper', venue: 'HPI', year: 2016)).to exist
  end
end
require 'rails_helper'

describe "Paper display page", :type => :feature do
  it "should display the papers's details" do
    paper = create(:paper)

    visit '/papers/1'

    expect(page).to have_text(paper.title)
    expect(page).to have_text(paper.venue)
    expect(page).to have_text(paper.year)
  end
end

describe "Paper index page", :type => :feature do
  it "should render" do
    visit '/papers'

    expect(page).to have_text('Papers')

    expect(find_link('Add paper')).to have_text('Add paper')
  end

  it "should display all papers" do
    paper = create(:paper)

    visit '/papers'

    expect(page).to have_text(paper.title)
    expect(page).to have_text(paper.year)
    expect(page).to have_text(paper.venue)

    expect(find_link('Show')).to have_text('Show') # TODO: Check if link points to correct show page
    expect(find_link('Edit')).to have_text('Edit') # TODO: Check if link points to correct edit page
    expect(find_link('Destroy')).to have_text('Destroy') # TODO: Check if link points to correct destroy page
  end
end

describe "Paper creation page", :type => :feature do
  it "should display 'New paper'" do
    visit '/papers/new'
    expect(page).to have_text("New paper")
  end

  it "should display validation errors" do
    visit '/papers/new'

    click_button('Create Paper')

    expect(page).to have_text("Title can't be blank")
  end

  it "should have a 'title' field" do
    visit '/papers/new'
    expect(page).to have_text("Title")
  end

  it "should have a 'venue' field" do
    visit '/papers/new'
    expect(page).to have_text("Venue")
  end

  it "should have a 'year' field" do
    visit '/papers/new'
    expect(page).to have_text("Year")
  end

  it "should have a submit button" do
    visit '/papers/new'
    expect(page.find_button("Create Paper").value).to eq("Create Paper")
  end

  it "should create new paper instances" do
    visit '/papers/new'
    fill_in('Title', with: 'My Paper')
    fill_in('Venue', with: 'HPI')
    fill_in('Year', with: 2016)
    click_button('Create Paper')

    expect(Paper.where(title: 'My Paper', venue: 'HPI', year: 2016)).to exist
  end
end

describe "Paper edit page", :type => :feature do
  it "should display the paper's details" do
    paper = create(:paper)

    visit '/papers/1/edit'

    expect(find_field('Title').value).to eq(paper.title)
    expect(find_field('Venue').value).to eq(paper.venue)
    expect(find_field('Year').value).to eq(paper.year.to_s)
  end
  it "should update the paper's title" do
    paper = create(:paper)

    visit '/papers/1/edit'

    expect(find_field('Title').value).to eq(paper.title)
    fill_in('Title', with: 'My Paper')
    click_button('Update Paper')

    visit '/papers/1'

    expect(page).to have_text('My Paper')
  end
  it "should display validation errors" do
    paper = create(:paper)

    visit '/papers/1/edit'

    fill_in('Title', with: '')
    click_button('Update Paper')

    expect(page).to have_text("Title can't be blank")
  end
end
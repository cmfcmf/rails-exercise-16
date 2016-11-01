require 'rails_helper'

describe "Author display page", :type => :feature do
  it "should display the author's details" do
    author = create(:author)

    visit '/authors/1'

    expect(page).to have_text(author.first_name)
    expect(page).to have_text(author.last_name)
    expect(page).to have_text(author.homepage)
  end
end

describe "Author edit page", :type => :feature do
  it "should display the author's details" do
    author = create(:author)

    visit '/authors/1/edit'

    expect(find_field('First name').value).to eq(author.first_name)
    expect(find_field('Last name').value).to eq(author.last_name)
    expect(find_field('Homepage').value).to eq(author.homepage)
  end
  it "should update the author's last name" do
    author = create(:author)

    visit '/authors/1/edit'

    expect(find_field('Last name').value).to eq(author.last_name)
    fill_in('Last name', with: 'Mathison')
    click_button('Update Author')

    visit '/authors/1'

    expect(page).to have_text('Mathison')
  end
  it "should display validation errors" do
    author = create(:author)

    visit '/authors/1/edit'

    fill_in('Last name', with: '')
    click_button('Update Author')

    expect(page).to have_text("Last name can't be blank")
  end
end

describe "Author index page", :type => :feature do
  it "should render" do
    visit '/authors'

    expect(page).to have_text('Authors')

    expect(find_link('Add author')).to have_text('Add author')
  end

  it "should be able to delete an author" do
    create(:author)

    visit '/authors/1/'
  end

  it "should display all authors" do
    create(:author)

    visit '/authors'

    expect(page).to have_text('Alan Turing')
    expect(page).to have_text('http://wikipedia.de/Alan_Turing')

    expect(find_link('Show')).to have_text('Show') # TODO: Check if link points to correct show page
    expect(find_link('Edit')).to have_text('Edit') # TODO: Check if link points to correct edit page
    expect(find_link('Destroy')).to have_text('Destroy') # TODO: Check if link points to correct destroy page
  end
end

describe "Author creation page", :type => :feature do
  it "should display 'New author'" do
    visit '/authors/new'
    expect(page).to have_text("New author")
  end

  it "should display validation errors" do
    visit '/authors/new'

    fill_in('First name', with: 'Alan')
    fill_in('Homepage', with: 'http://wikipedia.org/Alan_Turing')
    click_button('Create Author')

    expect(page).to have_text("Last name can't be blank")
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
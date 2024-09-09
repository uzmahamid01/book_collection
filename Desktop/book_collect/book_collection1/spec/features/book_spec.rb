
# spec/features/books_spec.rb
require 'rails_helper'

RSpec.feature "Books", type: :feature do
  scenario "User creates a book with valid data" do
    visit new_book_path
    fill_in "Title", with: "Test Book"
    fill_in "Author", with: "Test Author"
    fill_in "Price", with: 10.0
    select Date.today.year, from: "book_published_date_1i"
    select Date.today.strftime("%B"), from: "book_published_date_2i"
    select Date.today.day, from: "book_published_date_3i"
    click_button "Create Book"
    expect(page).to have_content("Book 'Test Book' was successfully created.")
  end

  scenario "User tries to create a book with an empty title" do
      visit new_book_path
      fill_in "Title", with: ""
      fill_in "Author", with: "Test Author"
      fill_in "Price", with: 10.0
      select Date.today.year, from: "book_published_date_1i"
      select Date.today.strftime("%B"), from: "book_published_date_2i"
      select Date.today.day, from: "book_published_date_3i"
      click_button "Create Book"
    expect(page).to have_content("Title can't be blank")
  end
end

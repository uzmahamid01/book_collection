require 'rails_helper'

RSpec.describe Book, type: :model do
  it "is valid with a title, author, price, and published date" do
    book = Book.new(
      title: "Valid Title",
      author: "Valid Author",
      price: 15.99,
      published_date: Date.today
    )
    expect(book).to be_valid
  end

  it "is invalid without a title" do
    book = Book.new(title: "", author: "Valid Author", price: 15.99, published_date: Date.today)
    expect(book).not_to be_valid
  end

  it "is invalid without an author" do
    book = Book.new(title: "Valid Title", author: "", price: 15.99, published_date: Date.today)
    expect(book).not_to be_valid
  end

  it "is invalid with a negative price" do
    book = Book.new(title: "Valid Title", author: "Valid Author", price: -10.0, published_date: Date.today)
    expect(book).not_to be_valid
  end

  it "is invalid without a published date" do
    book = Book.new(title: "Valid Title", author: "Valid Author", price: 15.99, published_date: nil)
    expect(book).not_to be_valid
  end
end

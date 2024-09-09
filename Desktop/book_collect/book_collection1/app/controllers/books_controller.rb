class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy, :delete]

  def index
    @books = Book.order(:title)
  end

  def show
    # @book is already set by the before_action :set_book
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, notice: "Book '#{@book.title}' was successfully created."
    else
    flash[:alert] = "Title can't be blank"
    render :new
    end
  end

  def edit
    # @book is already set by the before_action :set_book
  end

  def update
    if @book.update(book_params)
      redirect_to books_path, notice: "Book '#{@book.title}' was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    flash[:notice] = "Book '#{@book.title}' was successfully deleted."
    redirect_to books_path
  end

  def delete
    # This will render the delete confirmation view
  end

  def confirm_delete
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book '#{@book.title}' was successfully deleted."
    redirect_to books_path
  end

  private

  def set_book
    @book = Book.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Book not found."
    redirect_to books_path
  end

  def book_params
    params.require(:book).permit(:title, :author, :price, :published_date)
  end
end

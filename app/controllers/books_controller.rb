class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]

  def index
    @books = current_user.books.all
  end

  def show
    load_book
  end

  def edit
    load_book
  end

  def new
    build_book
  end

  def create
    build_book
    save_book or render :new
  end

  def update
    load_book
    build_book
    save_book or render :edit
  end

  def destroy
    load_book
    @book.destroy
    redirect_to root_path
  end

  private

  def build_book
    @book ||= book_scope.build
    @book.attributes = book_params
  end

  def save_book
    if @book.save
      redirect_to root_path
    end
  end

  def book_scope
    Book.all
  end

  def load_book
    @book = book_scope.find(params[:id])
  end

  def book_params
    book_params = params.fetch(:book, {})
    book_params.permit(:user_id, :name, :isbn, :reserved)
  end
end

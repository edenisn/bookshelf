class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def new
    update_book_attributes(current_user.id, true)
  end

  def destroy
    update_book_attributes
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end

  def update_book_attributes(user_id = nil, reserved = false)
    find_book

    if @book.present?
      @book.update_attributes(user_id: user_id, reserved: reserved)
      redirect_to books_path
    end
  end
end

class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def new
    find_book

    if @book.present?
      @book.update_attributes(user_id: current_user.id, reserved: true)
      redirect_to books_path
    end
  end

  def destroy
    find_book

    if @book.present?
      @book.update_attributes(user_id: nil, reserved: false)
      redirect_to books_path
    end
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end
end

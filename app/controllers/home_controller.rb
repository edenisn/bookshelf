class HomeController < ApplicationController
  def index
    @books = SearchBooksService.new(params).call
  end
end

class HomeController < ApplicationController
  def index
    @books = if params[:search]
               Book.search(params[:search])
                 .order("created_at DESC")
                 .paginate(page: params[:page], per_page: 3)
             else
               Book.paginate(page: params[:page], per_page: 10)
             end
  end
end

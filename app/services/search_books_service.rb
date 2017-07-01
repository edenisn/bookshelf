class SearchBooksService
  def initialize(params)
    @searhing_text = params[:search] if params[:search]
    @page = params[:page]
  end

  def call
    if @searhing_text.present?
      Book.search(@searhing_text)
        .order("created_at DESC")
        .paginate(page: @page, per_page: 5)
    else
      Book.paginate(page: @page, per_page: 10)
    end
  end
end

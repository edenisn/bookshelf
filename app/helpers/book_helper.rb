module BookHelper
  def expires_cache_time
    Time.now.beginning_of_hour + 1.hour
  end

  def all_reserved
    Book.reserved
  end
end

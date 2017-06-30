class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :books

  def cached_books_count
    Rails.cache.fetch([self, "books_count"]) { books.size }
  end
end

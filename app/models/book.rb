class Book < ActiveRecord::Base
  belongs_to :user

  validates :isbn, uniqueness: true
  validates :name, :isbn, presence: true
end

class Book < ActiveRecord::Base
  belongs_to :user, touch: true

  validates :isbn, uniqueness: true
  validates :name, :isbn, presence: true

  scope :revised, -> { where(revised: true) }

  def self.search(query)
    where('name LIKE :search OR isbn LIKE :search', search: "%#{query}%")
  end
end

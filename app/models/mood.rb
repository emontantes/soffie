class Mood < ApplicationRecord
  has_many :book_moods, dependent: :destroy
  has_many :users_books, through: :book_moods
  belongs_to :user

  def retrieve_categories_in_moods
    categories = []
    self.users_books.each do |book|
      book.categories.each do |category|
        categories << category.name unless categories.include?(category)
      end
    end
  end
end

class User < ApplicationRecord
  validates :name, presence: true
  has_many :genres, dependent: :destroy
  has_many :prices, dependent: :destroy
  has_one_attached :banner

  def genre_names
    genres.pluck(:name).join(", ")
  end

  def genre_names=(names)
    self.genres = names.split(",").map(&:strip).uniq.map { |name| genres.build(name: name) }
  end
end
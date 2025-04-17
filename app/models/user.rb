class User < ApplicationRecord
  # Devise já tá aqui por padrão
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :service_types, dependent: :destroy
  has_many :availabilities, dependent: :destroy
  has_many :user_genres, dependent: :destroy
  has_many :music_genres, through: :user_genres
  has_one_attached :cover_image
  has_one_attached :avatar

end

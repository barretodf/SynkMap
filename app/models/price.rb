class Price < ApplicationRecord
  belongs_to :user
  validates :description, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
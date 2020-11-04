class Category < ApplicationRecord
  has_many :articles_categories
  has_many :articles, through: :articles_categories

  validates :name, presence: true length: {minimum: 3, maximum: 10}
  validates :priority, presence: true
  validates :priority, numericality: { only_integer: true }

  scope :prior, -> { order(priority: :desc) }
end

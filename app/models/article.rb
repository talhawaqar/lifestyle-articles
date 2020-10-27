class Article < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  has_many :articles_categories, dependent: :destroy
  has_many :categories, through: :articles_categories
  has_many :votes, dependent: :destroy
  has_one_attached :article_image, dependent: :destroy

  validates :title, presence: true
  validates :text, presence: true
end

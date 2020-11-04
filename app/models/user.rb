class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, foreign_key: :author_id
  validates :username, presence: true, uniqueness: true, length: {minimum: 3, maximum: 10}
  validates :email, presence: true, uniqueness: true, length: {minimum: 4, maximum: 100}

end

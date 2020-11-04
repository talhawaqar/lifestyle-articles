# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# rubocop:disable Layout/LineLength

c1 = Category.create(name: 'Business', priority: 1)
c2 = Category.create(name: 'Education', priority: 2)
c3 = Category.create(name: 'Entertainment', priority: 3)
c4 = Category.create(name: 'Sports', priority: 4)

file = Rails.root.join('app', 'assets', 'images', 'img_1.jpg')
image = ActiveStorage::Blob.create_after_upload!(
  io: File.open(file, 'rb'),
  filename: 'img_1.jpg',
  content_type: 'image/jpg'
).signed_id

user = User.create(username: 'dev' ,email: 'dev@lifestyle.com', password: '123456')

article = Article.create(title: 'First Article', text: 'First Setup Article', article_image: image, categories: [c1, c2], author_id: user.id)

Vote.create(article_id: article.id, user_id: user.id)

file = Rails.root.join('app', 'assets', 'images', 'img_2.jpeg')
image = ActiveStorage::Blob.create_after_upload!(
  io: File.open(file, 'rb'),
  filename: 'img_2.jpeg',
  content_type: 'image/jpeg'
).signed_id

Article.create(title: 'Second Article', text: 'Second Setup Article', article_image: image, categories: [c2, c3], author_id: user.id)

file = Rails.root.join('app', 'assets', 'images', 'img_3.jpeg')
image = ActiveStorage::Blob.create_after_upload!(
  io: File.open(file, 'rb'),
  filename: 'img_3.jpeg',
  content_type: 'image/jpeg'
).signed_id
Article.create(title: 'Third Article', text: 'Third Setup Article', article_image: image, categories: [c3, c4], author_id: user.id)

file = Rails.root.join('app', 'assets', 'images', 'img_4.jpeg')
image = ActiveStorage::Blob.create_after_upload!(
  io: File.open(file, 'rb'),
  filename: 'img_4.jpeg',
  content_type: 'image/jpeg'
).signed_id
Article.create(title: 'Fourth Article', text: 'Fourth Setup Article', article_image: image, categories: [c1, c4], author_id: user.id)

# rubocop:enable Layout/LineLength

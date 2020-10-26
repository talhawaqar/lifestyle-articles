require 'rails_helper'
# rubocop:disable Metrics/BlockLength
describe 'the homepage', type: :feature do
  file = Rails.root.join('spec', 'test_img.jpg')
  image = ActiveStorage::Blob.create_after_upload!(
    io: File.open(file, 'rb'),
    filename: 'test_img.jpg',
    content_type: 'image/jpg' # Or figure it out from `name` if you have non-JPEGs
  ).signed_id
  
  let!(:user) {
    User.create(email: "dev@ugobensaid.test", password: "123456")
  }
  let!(:category) { Category.create(name: "test cat", priority: 1) }
  
  let!(:article) { 
    Article.create(title: "test 1", text: 'test 1 test', article_image: image, categories: [category], author_id: user.id)
  }

  let!(:vote) {Vote.create(article_id: article.id, user_id: user.id) }

  DatabaseCleaner.start

  it 'shows homepage' do
    visit root_path
    expect(page).to have_content 'test 1'
  end

  DatabaseCleaner.clean
end
# rubocop:enable Metrics/BlockLength

# rubocop:disable Layout/LineLength

require 'rails_helper'
RSpec.describe 'Edit Article', type: :feature do
  file = Rails.root.join('spec', 'test_img.jpg')
  image = ActiveStorage::Blob.create_after_upload!(
    io: File.open(file, 'rb'),
    filename: 'test_img.jpg',
    content_type: 'image/jpg' # Or figure it out from `name` if you have non-JPEGs
  ).signed_id

  let!(:user) do
    User.create(email: 'dev@ugobensaid.test', username: 'webdev', password: '123456')
  end
  let!(:category) { Category.create(name: 'test cat', priority: 1) }

  let!(:article) do
    Article.create(title: 'test 1', text: 'test 1 test', article_image: image, categories: [category], author_id: user.id)
  end

  DatabaseCleaner.start

  it 'Edit Article' do
    visit edit_article_path(article.id)
    within('#new_user') do
      fill_in 'user[email]', with: 'dev@ugobensaid.test'
      fill_in 'user[password]', with: '123456'
    end
    click_button 'Log in'

    within('#article_form') do
      fill_in 'article[title]', with: 'New one'
      fill_in 'article[text]', with: 'New test article'
      find("input[type='checkbox'][value='#{category.id}']").set(true)
      attach_file('article[article_image]', "#{Rails.root}/spec/test_img.jpg")
    end
    click_button 'Edit Article'
    sleep(1)
    expect(page).to have_content('Article Updated')
  end

  DatabaseCleaner.clean
end
# rubocop:enable Layout/LineLength

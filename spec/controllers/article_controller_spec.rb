require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let!(:user) do
    User.create(email: 'dev@ugobensaid.test', username: 'devtest', password: '123456')
  end
  let!(:article) { Article.create(title: 'test article', text: 'Test Body asd', author_id: user.id) }

  DatabaseCleaner.start

  before(:each) do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a 200 OK' do
      get :index, params: { action: :index, controller: :articles }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'returns a 200 OK' do
      get :new, params: { action: :new, controller: :articles }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'returns a 200 OK' do
      get :new, params: { action: :new, controller: :articles }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns a 200 OK' do
      get :show, params: { action: :show, id: article.id, controller: :articles }
      expect(response).to have_http_status(:success)
    end
  end
  DatabaseCleaner.clean
end

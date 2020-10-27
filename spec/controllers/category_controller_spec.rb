require 'rails_helper'

RSpec.describe CategoryController, type: :controller do
  let!(:category) do
    Category.create(name: 'cat-1', priority: '1')
  end
  DatabaseCleaner.start
  describe 'GET #show' do
    it 'returns a 200 OK' do
      get :show, params: { action: :show, id: category.id, controller: :category }
      expect(response).to have_http_status(:success)
    end
  end
  DatabaseCleaner.clean
end

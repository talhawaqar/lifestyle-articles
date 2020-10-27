# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    it 'returns a 200 OK' do
      get :index, params: { action: :index, controller: :home }
      expect(response).to have_http_status(:success)
    end
  end
  DatabaseCleaner.clean
end

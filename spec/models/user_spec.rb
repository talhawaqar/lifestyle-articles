# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  DatabaseCleaner.start

  describe User do
    context 'associations' do
      it { should have_many(:articles) }
    end
  end
  DatabaseCleaner.clean
end

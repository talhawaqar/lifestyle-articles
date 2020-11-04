require 'rails_helper'

RSpec.describe User, type: :model do
  DatabaseCleaner.start

  describe User do
    context 'validates username' do
      it { should validate_presence_of(:username) }
    end

    context 'associations' do
      it { should have_many(:articles) }
    end
  end
  DatabaseCleaner.clean
end

require 'rails_helper'

RSpec.describe User, type: :model do
  DatabaseCleaner.start

  describe User do
    context 'associations' do
      it { should have_many(:aricles) }
    end
  end
  DatabaseCleaner.clean
end

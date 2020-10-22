require 'rails_helper'

RSpec.describe Category, type: :model do
  DatabaseCleaner.start

  describe Category do
    context 'validates name' do
      it { should validate_presence_of(:name) }
    end

    context 'validates priority' do
      it { should validate_presence_of(:priority) }
    end


    context 'associations' do
      it { should have_many(:articles_categories) }
      it { should have_many(:articles) }
    end
  end
  DatabaseCleaner.clean
end

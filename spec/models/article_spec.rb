require 'rails_helper'

RSpec.describe Article, type: :model do
  DatabaseCleaner.start

  describe Article do
    context 'validates title' do
      it { should validate_presence_of(:title) }
    end

    context 'validates text' do
      it { should validate_presence_of(:text) }
    end

    context 'associations' do
      it { should have_many(:categories) }
      it { should have_many(:articles_categories) }
      it { should have_many(:votes) }
      it { should belong_to(:user) }
      it { should have_one_attached(:article_image) }
    end
  end
  DatabaseCleaner.clean
end

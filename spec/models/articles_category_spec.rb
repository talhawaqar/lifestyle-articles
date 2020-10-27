require 'rails_helper'

RSpec.describe ArticlesCategory, type: :model do
  DatabaseCleaner.start

  describe ArticlesCategory do
    context 'associations' do
      it { should belong_to(:article) }
      it { should belong_to(:category) }
    end
  end
  DatabaseCleaner.clean
end

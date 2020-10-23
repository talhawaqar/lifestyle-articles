# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vote, type: :model do
  DatabaseCleaner.start

  describe Vote do
    context 'associations' do
      it { should belong_to(:user) }
      it { should belong_to(:article) }
    end
  end
  DatabaseCleaner.clean
end

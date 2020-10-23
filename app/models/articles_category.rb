# frozen_string_literal: true

class ArticlesCategory < ApplicationRecord
  belongs_to :article
  belongs_to :category
end

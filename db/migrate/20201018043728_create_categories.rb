# frozen_string_literal: true

# rubocop:disable Style/Documentation

class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :priority

      t.timestamps
    end
  end
end

# rubocop:enable Style/Documentation

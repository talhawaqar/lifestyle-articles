class CreateTableCategoriesArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles_categories, id: false do |t|
      t.belongs_to :article
      t.belongs_to :category
    end
  end
end

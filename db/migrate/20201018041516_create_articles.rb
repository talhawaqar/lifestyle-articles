class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.integer :AuthorId
      t.string :Title
      t.text :Text

      t.timestamps
    end
  end
end

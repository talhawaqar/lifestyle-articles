class AddUserForeignKeyToAuthor < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :author_id, foreign_key: { to_table: :users }
  end
end

class AddAuthorIdToBooks < ActiveRecord::Migration[8.0]
  def change
    add_column :books, :author_id, :integer
  end
end

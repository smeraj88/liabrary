class AddBookCountToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :book_count, :integer
  end
end

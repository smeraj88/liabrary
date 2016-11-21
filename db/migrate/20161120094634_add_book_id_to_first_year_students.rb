class AddBookIdToFirstYearStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :first_year_students, :book_id, :integer
  end
end

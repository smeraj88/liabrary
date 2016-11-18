class CreateFirstYearStudents < ActiveRecord::Migration[5.0]
  def up
    create_table :first_year_students do |t|
      t.string :stud_name
      t.string :year
      t.string :book_name
      t.integer :book_count

      t.timestamps
    end
  end
  
  def down
    drop_table :first_year_students
  end
end

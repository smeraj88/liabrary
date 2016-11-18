class FirstYearStudent < ApplicationRecord
    has_many :Book
    validates :stud_name,:year,:book_name,:book_count ,:presence=>true
    
end

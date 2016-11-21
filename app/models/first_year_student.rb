class FirstYearStudent < ApplicationRecord
    has_many :book
    has_many :subject
    validates :stud_name,:year,:book_name,:book_count,:book_id , :presence=>true
    
end

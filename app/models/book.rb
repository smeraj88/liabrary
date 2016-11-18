class Book < ApplicationRecord
    belongs_to :subject
    belongs_to :user
    belongs_to :FirstYearStudent
    validates :title,:price,:subject_id,:description, :presence => true
end

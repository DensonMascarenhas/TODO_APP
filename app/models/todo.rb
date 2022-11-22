class Todo < ApplicationRecord
    validates :title, presence:true, length:{minimum:6, maximum:50}
    validates :description, presence:true, length:{minimum:6, maximum:200}
    validates :due_date, presence:true
    validates :priority, presence:true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 3 }
end

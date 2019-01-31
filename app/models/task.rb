class Task < ApplicationRecord
    belongs_to :user

    validates_numericality_of :priority, less_than_or_equal_to: 3, greater_than_or_equal_to: 0

    after_initialize :init
    def init
        self.status ||= "not done"
    end
end

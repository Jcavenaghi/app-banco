class Day < ApplicationRecord
    belongs_to :branch_office
    validates :day_name, presence: true
    validates :begin_turn, presence: true
    validates :end_turn, presence: true
end

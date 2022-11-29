class Day < ApplicationRecord
    belongs_to :branch_office
    validates :day_name, presence: true
end

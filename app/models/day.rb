class Day < ApplicationRecord
    belongs_to :sucursale
    validates :day_name, presence: true
end

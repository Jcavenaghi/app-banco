class Day < ApplicationRecord
    belongs_to :branch_office
    validates :day_name, presence: true, uniqueness: { scope: :branch_office_id, 
                message: "Existe solo un día de cada día por sucursal" }
    validates :begin_turn, presence: true
    validates :end_turn, presence: true

    validate :hours

    def hours
        if (end_turn < begin_turn)
            self.errors.add(:base, "La hora de fin no puede ser mayor a la hora de inicio")
        end
    end
    enum day_name: [:domingo, :lunes, :martes, :miercoles, :jueves, :viernes]
end

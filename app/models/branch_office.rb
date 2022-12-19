class BranchOffice < ApplicationRecord
    #la sucursal tiene varios dias (lun a vie)
    has_many :days, dependent: :delete_all
    #la sucursal tiene varios turnos de varios clientes
    has_many :turns
    has_many :admin_users
    validates :name, presence: true
    validates :direc, presence: true
    validates :tel, presence: true
    after_create :assign_days
    private
        def assign_days
            Day.create!(day_name: :lunes, begin_turn: '8:00', end_turn: '16:00', branch_office: self)
            Day.create!(day_name: :martes, begin_turn: '8:00', end_turn: '16:00', branch_office: self)
            Day.create!(day_name: :miercoles, begin_turn: '8:00', end_turn: '16:00', branch_office: self)
            Day.create!(day_name: :jueves, begin_turn: '8:00', end_turn: '16:00', branch_office: self)
            Day.create!(day_name: :viernes, begin_turn: '8:00', end_turn: '16:00', branch_office: self)
        end
end

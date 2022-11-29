class BranchOffice < ApplicationRecord
    #la sucursal tiene varios dias (lun a vie)
    has_many :days
    #la sucursal tiene varios turnos de varios clientes
    has_many :turns
    has_many :admin_users
    validates :name, presence: true
    validates :direc, presence: true
    validates :tel, presence: true
end

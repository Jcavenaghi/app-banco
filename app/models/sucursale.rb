class Sucursale < ApplicationRecord
    #la sucursal tiene varios dias (lun a vie)
    has_many :days
end

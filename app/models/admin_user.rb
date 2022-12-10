class AdminUser < ApplicationRecord
  validates :role, presence: true
  validate :staff_with_office 

  def staff_with_office
    if (self.role == "staff")
      if (!self.branch_office_id)
        errors.add :base, "Un staff debe tener una sucursal asignada"
      end
    else
      if (self.branch_office_id)
        if (self.role != "staff")
          errors.add :base, "Si se selecciona una sucursal, se debe registrar un staff, no un admin"
        end
      end
    end
  end
  #un usuario con rol staff puede estar relacionado 
  # a varios turnos (se hizo cargo de x turnos)
  has_many :staff_user_turns, class_name: 'Turn', foreign_key: 'staff_user_id'
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
  #admin = 0, staff = 1
  enum role: [:admin, :staff]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role 
    self.role ||= :staff
  end
end

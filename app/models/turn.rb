class Turn < ApplicationRecord
  belongs_to :client_user, class_name: 'User'
  belongs_to :staff_user, class_name: 'AdminUser', optional: true
  belongs_to :branch_office
  validates :fecha, presence: true 
  validates :reason, presence: true
  validates :branch_office_id, presence: true
  validates :client_user_id, presence: true

  validate :state_true

  def state_true
    p self.comment
    if (self.state)
      if (self.comment == nil) || (self.comment == "")
        errors.add :base, "Debe agregar un comentario al turno"
      end
    else
      if (!self.state)
        if (self.comment != nil) && (self.comment != "")
          errors.add :base, "Un turno pendiente no debe tener comentario"
        end
      end
    end
  end
end

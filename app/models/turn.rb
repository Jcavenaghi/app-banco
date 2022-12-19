class Turn < ApplicationRecord
  belongs_to :client_user, class_name: 'User'
  belongs_to :staff_user, class_name: 'AdminUser', optional: true
  belongs_to :branch_office
  validates :fecha, presence: true 
  validates :reason, presence: true
  validates :branch_office_id, presence: true
  validates :client_user_id, presence: true

  validates :comment, presence: true, if: -> {state}

  # def state_true?
  #   if (self.state)
  #     if (self.comment == nil) || (self.comment == "")
  #       errors.add :base, "Debe agregar un comentario al turno"
  #     end
  #   else
  #     if (!self.state)
  #       if (self.comment != nil) && (self.comment != "")
  #         errors.add :base, "Un turno pendiente no debe tener comentario"
  #       end
  #     end
  #   end
  # end
end

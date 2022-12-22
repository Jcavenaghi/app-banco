class Turn < ApplicationRecord
  belongs_to :client_user, class_name: 'User'
  belongs_to :staff_user, class_name: 'AdminUser', optional: true
  belongs_to :branch_office
  validates :fecha, presence: true 
  validates :reason, presence: true
  validates :branch_office_id, presence: true
  validates :client_user_id, presence: true
  validates :comment, presence: true, if: -> {state}
  
  validate :future_date

  def future_date
      if (fecha < DateTime.now)
        self.errors.add(:base, "La fecha del turno debe ser mayor a la fecha actual")
      end
  end

end

class AdminUser < ApplicationRecord
  validates :role, presence: true
  validates :branch_office_id, presence: true, if: :staff?
  validates :branch_office_id, absence: true, unless: :staff?
  def staff?
    self.role == "staff"
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
end

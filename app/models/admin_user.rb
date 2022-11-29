class AdminUser < ApplicationRecord

  #un usuario con rol staff puede estar relacionado 
  # a varios turnos (se hizo cargo de x turnos)
  has_many :staff_user_turns, class_name: 'Turn', foreign_key: 'staff_user_id'
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  enum role: [:staff, :admin]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role 
    self.role ||= :staff
  end
end

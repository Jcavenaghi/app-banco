class User < ApplicationRecord
  #2 has_many: uno para clientes, otros para staff.
  #hay 2 belongs_to del lado de turn.


  #un cliente puede tener muchos turnos

  has_many :client_user_turns, class_name: 'Turn', foreign_key: 'client_user_id' 
  
  #un usuario con rol staff puede estar relacionado 
  # a varios turnos (se hizo cargo de x turnos)

  has_many :staff_user_turns, class_name: 'Turn', foreign_key: 'staff_user_id'
  has_many :sucursales, :through => :client_user_turns

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  #roles dentro de enum e inicialización por default en client
  
  enum role: [:client, :staff, :admin]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role 
    self.role ||= :client
  end
end

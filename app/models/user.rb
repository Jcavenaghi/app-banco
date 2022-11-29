class User < ApplicationRecord
  #2 has_many: uno para clientes, otros para staff.
  #hay 2 belongs_to del lado de turn.

  #un cliente puede tener muchos turnos

  has_many :client_user_turns, class_name: 'Turn', foreign_key: 'client_user_id' 

  has_many :branch_offices, :through => :client_user_turns

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
end

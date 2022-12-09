# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
p "🗑️ Eliminando base de datos..."
Turn.destroy_all
Day.destroy_all
BranchOffice.destroy_all
User.destroy_all
AdminUser.destroy_all
p "Base de datos eliminada"
p "⏳ creando nueva base de datos.."
s1 = BranchOffice.create!(name:"Chascomus", direc:"Libres Del Sur 123", tel:"2241988772")
s2 = BranchOffice.create!(name:"La Plata", direc:"Calle 10 1986", tel:"2218788118")
s3 = BranchOffice.create!(name:"CABA", direc:"Av. 9 de Julio 12", tel:"2331191674")

Day.create!(day_name:1, begin_turn: '8:00', end_turn: '16:00', branch_office:s1)
Day.create!(day_name:1, begin_turn: '10:00', end_turn: '18:00', branch_office:s2)
Day.create!(day_name:1, begin_turn: '7:00', end_turn: '15:00', branch_office:s3)

Day.create!(day_name:2, begin_turn: '12:00', end_turn: '18:00', branch_office:s1)
Day.create!(day_name:2, begin_turn: '10:00', end_turn: '20:00', branch_office:s2)
Day.create!(day_name:2, begin_turn: '12:00', end_turn: '14:00', branch_office:s3)

Day.create!(day_name:3, begin_turn: '8:00', end_turn: '16:00', branch_office:s1)
Day.create!(day_name:3, begin_turn: '8:00', end_turn: '16:00', branch_office:s2)
Day.create!(day_name:3, begin_turn: '8:00', end_turn: '16:00', branch_office:s3)

Day.create!(day_name:4, begin_turn: '9:00', end_turn: '14:00', branch_office:s1)
Day.create!(day_name:4, begin_turn: '9:00', end_turn: '14:00', branch_office:s2)
Day.create!(day_name:4, begin_turn: '9:00', end_turn: '14:00', branch_office:s3)

Day.create!(day_name:5, begin_turn: '11:00', end_turn: '14:00', branch_office:s1)
Day.create!(day_name:5, begin_turn: '11:00', end_turn: '14:00', branch_office:s2)
Day.create!(day_name:5, begin_turn: '11:00', end_turn: '14:00', branch_office:s3)

staff = AdminUser.create!(email: "staff@gmail.com", password: "passw0rd", password_confirmation: "passw0rd", role: 1)
c1 = User.create!(email: "client@gmail.com", password: "passw0rd", password_confirmation: "passw0rd")
c2= User.create!(email: "client2@gmail.com", password: "passw0rd", password_confirmation: "passw0rd")

Turn.create!(fecha: '2022-12-28 18:00:00.000000', reason:"gripe leve", state: false, branch_office_id:s1.id, client_user_id:c1.id)
Turn.create!(fecha: '2022-12-29 10:00:00.000000', reason:"gripe grave", state: false, branch_office_id:s2.id, client_user_id:c2.id)
Turn.create!(fecha: '2022-12-28 12:00:00.000000', reason:"cualquier razon", state: true, comment: "excelente atencion", branch_office_id: s1.id, client_user_id: c1.id, staff_user_id: staff.id)

p " 👾 Base de datos creada!"
AdminUser.create!(email: 'staff@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', role: 1) if Rails.env.development?
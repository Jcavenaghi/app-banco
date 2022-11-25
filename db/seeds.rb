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
Sucursale.destroy_all
User.destroy_all
p "Base de datos eliminada"
p "⏳ creando nueva base de datos.."
s1 = Sucursale.create!(name:"Chascomus", direc:"Libres Del Sur 123", tel:"2241988772")
s2 = Sucursale.create!(name:"La Plata", direc:"Calle 10 1986", tel:"2218788118")
s3 = Sucursale.create!(name:"CABA", direc:"Av. 9 de Julio 12", tel:"2331191674")

Day.create!(day_name:"Lunes", sucursale:s1)
Day.create!(day_name:"Martes", sucursale:s2)
Day.create!(day_name:"Miercoles,", sucursale:s1)
Day.create!(day_name:"Jueves", sucursale:s2)
Day.create!(day_name:"Viernes", sucursale:s1)

staff = User.create!(email: "staff@gmail.com", password: "passw0rd", password_confirmation: "passw0rd", role: 1)
c1 = User.create!(email: "client@gmail.com", password: "passw0rd", password_confirmation: "passw0rd")
c2= User.create!(email: "client2@gmail.com", password: "passw0rd", password_confirmation: "passw0rd")

Turn.create!(fecha: '2022-12-28 18:00:00.000000', reason:"gripe leve", sucursale_id:s1.id, client_user_id:c1.id)
Turn.create!(fecha: '2022-12-29 10:00:00.000000', reason:"gripe grave", sucursale_id:s2.id, client_user_id:c2.id)
Turn.create!(fecha: '2022-12-28 12:00:00.000000', reason:"cualquier razon", state: true, comment: "excelente atencion", sucursale_id: s1.id, client_user_id: c1.id, staff_user_id: staff.id)

p " 👾 Base de datos creada!"

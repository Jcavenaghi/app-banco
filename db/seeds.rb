# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
s1 = Sucursale.create(name:"Chascomus", direc:"Libres Del Sur 123", tel:"2241988772")
s2 = Sucursale.create(name:"La Plata", direc:"Calle 10 1986", tel:"2218788118")
s3 = Sucursale.create(name:"CABA", direc:"Av. 9 de Julio 12", tel:"2331191674")
Day.create(day_name:"Lunes", sucursale:s1)
Day.create(day_name:"Martes", sucursale:s2)
Day.create(day_name:"Miercoles,", sucursale:s1)
Day.create(day_name:"Jueves", sucursale:s2)
Day.create(day_name:"Viernes", sucursale:s1)


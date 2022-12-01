# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
    ruby 3.0.2p107 (2021-07-07 revision 0db68f0233) [x86_64-linux]
    
* System dependencies

* Configuration

* Database creation
    Decidi realizar 2 modelos diferentes para admin_user(admin y staff) y otro modelo para user(cliente). Ambos modelos utilizan device, en particular admin_user se crea a partir de la gema activeadmin.
    Tome la decisión de que cuando se crea una nueva sucursal, los horarios de la misma sean por defecto de 8:00 a 16:00 para todos los días.

* Database initialization
    rails db:setup inicializa todo, incluido los seeds brindados.
    rails db:seed solo para generar las seeds(elimina lo que hay y vuelve a crear)

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

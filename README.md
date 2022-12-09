# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
    ruby 3.0.2p107 (2021-07-07 revision 0db68f0233) [x86_64-linux]
    
* System dependencies

* Configuration

* Database creation
    . Decidi realizar 2 modelos diferentes para admin_user(admin y staff) y otro modelo para user(cliente). Ambos modelos utilizan device, en particular admin_user se crea a partir de la gema activeadmin.
    . Tome la decisión de que cuando se crea una nueva sucursal, los horarios de la misma sean por defecto de 8:00 a 16:00 para todos los días.
    . Para cancelar turno, decidí que se elimine de todos lados al momento de eliminar.
    . en la vista de home, se muestran todas las sucursales del banco, además de información sobre los horarios de atención de cada sucursal.
    . Para la información del cliente, solo muestro el mail (no hay otra cosa que mostrar) y utilizo el mismo apartado para la edición de la contraseña
    . Para un mismo día y hora en una misma sucursal pueden existir x turnos (Se hablo en la clase donde se presento el proyecto).
    . Un cliente puede tener 2 turnos el mismo dia en diferentes sucursales, no en la misma.

* Database initialization
    rails db:setup inicializa todo, incluido los seeds brindados.
    rails db:seed solo para generar las seeds(elimina lo que hay y vuelve a crear)

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

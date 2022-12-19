# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
    ruby 3.0.2p107 (2021-07-07 revision 0db68f0233) [x86_64-linux]
    
* System dependencies

* Configuration

* Database creation
    . Decidi realizar 2 modelos diferentes para el manejo de los usuarios. admin_user(admin y staff) y user(cliente). Ambos modelos utilizan device, en particular admin_user se crea a partir de la gema activeadmin.
    . Cada usuario puede tener solo un rol, este no se puede cambiar.
    . Tome la decisión de que cuando se crea una nueva sucursal, los horarios de la misma sean por defecto de 8:00 a 16:00 para todos los días.
    . Para eliminar una sucursal, la misma no debe tener referencias. Si ya ha sido asignada a algun personal o hay turnos completados en la misma, no se puede borrar.
    . Si se cambia la hora de atención en un día, los turnos que ya existian no se verán modificados.
    . Para cancelar turno, decidí que se elimine de todos lados al momento de eliminar.
    . La único que se puede modificar de un turno, es la razon de la solicitud.
    . en la vista de home, se muestran todas las sucursales del banco, además de información sobre los horarios de atención de cada sucursal.
    . Para la información del cliente, solo muestro el mail (no hay otra cosa que mostrar) y utilizo el mismo apartado para la edición de la contraseña
    . Para un mismo día y hora en una misma sucursal pueden existir x turnos (Se hablo en la clase donde se presento el proyecto).
    . Un cliente puede tener solamente un turno por día, es decir, no puede tener varios turnos en diferentes sucursales el mismo día.

* Database initialization
    rails db:setup inicializa todo, incluido los seeds brindados. (hacer solo la primera vez)
    rails db:seed solo para generar las seeds(elimina lo que hay y vuelve a crear). Realizar esta opción si se modifica algo el los seeds, o quiere restablecer la bd.
    rails s levanta el servidor.

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
    . http://127.0.0.1:3000 llevara al login de usuario cliente, en caso de no estar logeado.
    . Para acceder al login y funcionalidad de administrador/staff ir a http://127.0.0.1:3000/admin. Automaticamente lleva al login

* ...

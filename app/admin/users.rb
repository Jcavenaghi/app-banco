ActiveAdmin.register User do
  config.filters = false

  permit_params :email, :password, :password_confirmation
  form do |f|
    f.inputs do
      f.input :email
      if f.object.new_record? #para ver si estoy en un new o un edit
        f.input :password, required: f.object.new_record?
        f.input :password_confirmation, required: f.object.new_record?
      end
    end
    f.actions
  end

  controller do
    def destroy
      if (current_admin_user.admin?)
        super
      else
        redirect_to admin_users_path, notice: "No posee permisos para eliminar un usuario."
      end
    end

    def edit
      if (current_admin_user.admin?)
        super
      else
        redirect_to admin_users_path, notice: "No posee permisos para editar un usuario."
      end
    end

    def new
      if (current_admin_user.admin?)
        super
      else
        redirect_to admin_users_path, notice: "No posee permisos para crear un usuario."
      end
    end
  end

  
end

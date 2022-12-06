ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :role, :branch_office_id
  config.filters = false
  actions :all, :except => [:edit, :destroy]

  controller do
    def edit
      #con params[:id] obtenemos el id de la sucursal seleccionada
      if (current_admin_user.id == params[:id].to_i)
        super #permite editar la información(un admin/staff solo puede editar su información, no la de otros)
      else
        redirect_to admin_admin_users_path, notice: "No puede editar información de otro administrador/staff"
      end
    end
  end

  index do
    selectable_column
    id_column
    column :email
    column :role
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      if f.object.new_record?
        f.input :role, required: f.object.new_record?
        f.input :branch_office_id, :as => :select, :collection => BranchOffice.all.collect {|branch_office| [branch_office.name, branch_office.id]}, required: f.object.new_record?
      end
    end
    f.actions
  end
end

ActiveAdmin.register BranchOffice do
  config.filters = false
  actions :all
  permit_params :name, :direc, :tel
  controller do
    def destroy
      if (current_admin_user.admin?)
        #con params[:id] obtenemos el id de la sucursal seleccionada
        if (BranchOffice.find(params[:id]).turns.find_by(state: false))
          redirect_to admin_branch_offices_path, notice: "No se puede eliminar una sucursal con turnos pendientes"
        else
          BranchOffice.find(params[:id]).destroy
          redirect_to admin_branch_offices_path, notice: "Sucursal eliminada"
        end
      else
        redirect_to admin_branch_offices_path, notice: "No posee permisos para eliminar una sucursal."
      end
    end
    def edit
      if (current_admin_user.admin?)
        super
      else
        redirect_to admin_branch_offices_path, notice: "No posee permisos para editar una sucursal."
      end
    end
    def new
      if (current_admin_user.admin?)
        #hacer una nueva y crear dias y horarios asociados
        super
      else
        redirect_to admin_branch_offices_path, notice: "No posee permisos para crear una sucursal."
      end
    end
  end
  #vistas
  show do
    default_main_content
    panel "Dias habiles" do
      table_for branch_office.days do
        column :day_name
        column :begin_turn
        column :end_turn
      end
    end
  end
end

ActiveAdmin.register BranchOffice do
  config.filters = false
  actions :all, :except => [:destroy]
  # permit_params :name, :direc, :tel

  controller do
    def destroy
      # if (current_admin_user.admin?)
        if (BranchOffice.find(params[:id]).turns.find_by(state: false))
          redirect_to admin_branch_offices_path, notice: "No se puede eliminar, tiene turnos pendientes"
        else
          BranchOffice.find(params[:id]).destroy
          redirect_to admin_branch_offices_path, notice: "Sucursal eliminada"
        end
      # else
      #   redirect_to admin_branch_offices_path, notice: "No tienes permisos para eliminar"
    end
  end
  show do
    default_main_content
    panel "Dias habiles" do
      table_for branch_office.days do
        column :day_name
        column :begin_turn
        column :end_turn
        #revisar como hacer link_to
      end
    end
  end
  
end

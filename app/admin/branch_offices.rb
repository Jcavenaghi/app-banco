ActiveAdmin.register BranchOffice do
  config.filters = false
  actions :all
  permit_params :name, :direc, :tel
  controller do
    def destroy
      #con params[:id] obtenemos el id de la sucursal seleccionada
      office = BranchOffice.find(params[:id])
      if (office.turns.find_by(state: false))
        redirect_to admin_branch_offices_path, notice: "No se puede eliminar una sucursal con turnos pendientes"
      elsif ( (office.turns.find_by(state: true)) || (office.admin_users != []))
        p office.admin_users
        redirect_to admin_branch_offices_path, notice: "No se puede eliminar una sucursal que ha sido referenciada"
      else
        office.destroy
        redirect_to admin_branch_offices_path, notice: "Sucursal eliminada"
      end
    end
  end
  #vistas
  show do
    default_main_content
    panel "Dias habiles" do
      table_for branch_office.days do
        column :day_name
        column (:begin_turn) {|obj| obj.begin_turn.strftime("%I:%M%p")} 
        column (:end_turn) {|obj| obj.end_turn.strftime("%I:%M%p")} 
      end
    end
  end
end

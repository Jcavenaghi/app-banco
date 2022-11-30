ActiveAdmin.register Turn do
  config.filters = false
  permit_params :fecha, :reason, :state, :comment, :client_user_id, :staff_user_id, :branch_office_id
  
  form do |f|
    f.object.staff_user_id = current_admin_user.id
    f.inputs do
      f.input :state, label: "Atendido"
      f.input :comment
      f.input :staff_user_id, input_html: { disabled: true }
    end
    f.actions
  end
  index do 
    selectable_column
    column :fecha
    column :reason
    column :state
    column :client_user
    column :staff_user
    column :branch_office
    actions
  end
  controller do
    def scoped_collection
      if current_admin_user.staff?
        Turn.where(branch_office_id: current_admin_user.branch_office_id)
      else
        Turn.all
      end
    end
    
    def edit
      if (current_admin_user.staff?)
        office_id = AdminUser.find(current_admin_user.id).branch_office_id
        if (Turn.find(params[:id]).branch_office_id == office_id ) && (Turn.find(params[:id]).state == false) 
          super
        else
          redirect_to admin_turns_path, notice: "El turno corresponde a otra sucursal o ya ha sido atentido"
        end
      else
        redirect_to admin_turns_path, notice: "No tiene acceso para editar"
      end
    end
  end
end

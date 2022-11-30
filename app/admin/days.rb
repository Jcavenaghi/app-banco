ActiveAdmin.register Day do
  config.filters = false
  actions :all, :except => [:new, :destroy, :edit]
  permit_params :day_name, :begin_turn, :end_turn, :sucursale_id
  
  form do |f|
    f.inputs do
      f.input :begin_turn
      f.input :end_turn
    end
    f.actions
  end
  controller do
    def edit
      if current_admin_user.admin?
        super
      else
        redirect_to admin_days_path, notice: "No tiene acceso para editar"
      end
    end
  end
  
end

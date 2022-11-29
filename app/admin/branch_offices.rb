ActiveAdmin.register BranchOffice do
  config.filters = false
  actions :index, :show, :create, :update, :destroy
  # permit_params :name, :direc, :tel

  action_item :delete, only: :delete do
    link_to 'View on site', branch_office_path(post) if post.published?
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
  # show do
  #   #si existe un turno con state false (no atendido), no se puede eliminar la sucursal
  #   if (BranchOffice.turns.find_by(state: false))
  #     @BranchOffice.destroy
  #     redirect_to branch_offices_url, notice: "Sucursal eliminada"
  #  else
  #     render :new, status: :unprocessable_entity
  #  end
  # end
  
end

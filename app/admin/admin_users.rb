ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :role, :branch_office_id
  config.filters = false
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
      f.input :branch_office_id, :as => :select, :collection => BranchOffice.all.collect {|branch_office| [branch_office.name, branch_office.id]}
    end
    f.actions
  end

end

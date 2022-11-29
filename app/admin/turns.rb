ActiveAdmin.register Turn do
  config.filters = false
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :fecha, :reason, :state, :comment, :client_user_id, :staff_user_id, :branch_office_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:fecha, :reason, :state, :comment, :client_user_id, :staff_user_id, :branch_office_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

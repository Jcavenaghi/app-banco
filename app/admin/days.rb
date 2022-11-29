ActiveAdmin.register Day do
  config.filters = false
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :day_name, :begin_turn, :end_turn, :sucursale_id
  
  # or
  #
  # permit_params do
  #   permitted = [:day_name, :begin_turn, :end_turn, :sucursale_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

ActiveAdmin.register User do
  config.filters = false

  
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :sucursale_id, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :role
  #
  # or
  #
  # permit_params do
  #   permitted = [:sucursale_id, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :role]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

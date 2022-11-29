ActiveAdmin.register User do
  config.filters = false

  permit_params :email, :password, :password_confirmation
  form do |f|
    f.inputs do
      f.input :email
      if f.object.new_record?
        f.input :password, required: f.object.new_record?
        f.input :password_confirmation, required: f.object.new_record?
      end
    end
    f.actions
  end

  
end

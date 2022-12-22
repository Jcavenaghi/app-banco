ActiveAdmin.register Day do
  config.filters = false
  actions :all, :except => [:new, :destroy]
  permit_params :day_name, :begin_turn, :end_turn, :branch_office_id
  
  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :begin_turn
      f.input :end_turn
    end
    f.actions
  end
  
  index do
    selectable_column
    id_column
    column :day_name
    column (:begin_turn) {|obj| obj.begin_turn.strftime("%I:%M%p")} 
    column (:end_turn) {|obj| obj.end_turn.strftime("%I:%M%p")} 
    column :branch_office
    column :created_at
    column :update_at
    actions
  end

  show do
    attributes_table do
      row :day_name
      row (:begin_turn) {|obj| obj.begin_turn.strftime("%I:%M%p")} 
      row (:end_turn) {|obj| obj.end_turn.strftime("%I:%M%p")} 
      row :branch_office
    end
  end
  
end

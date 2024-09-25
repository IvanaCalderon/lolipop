ActiveAdmin.register Department do

  permit_params :name, :status

  index do
    selectable_column
    id_column
    column :name
    column :status do |department|
      department.status == "active" ? "Active" : "Inactive"
    end
    actions
  end

  filter :name
  filter :status, as: :select, collection: Department.statuses.map { |key, value| [key.titleize, value] }

  form do |f|
    f.inputs "Department Details" do
      f.input :name
      f.input :status, as: :select, collection: Department.statuses.keys
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :status
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
  
end

ActiveAdmin.register Competency do

  permit_params :description, :status

  index do
    selectable_column
    id_column
    column :description
    column :status do |competency|
      competency.status == "active" ? "Active" : "Inactive"
    end
    actions
  end

  # Filters for search functionality in the index page
  filter :description
  filter :status, as: :select, collection: Competency.statuses.map { |key, value| [key.titleize, value] }

  # Form for creating/editing a competency
  form do |f|
    f.inputs "Competency Details" do
      f.input :description
      f.input :status, as: :select, collection: Competency.statuses.keys
    end
    f.actions
  end

  # Show page for a competency
  show do
    attributes_table do
      row :description
      row :status do |competency|
        competency.status.capitalize
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end

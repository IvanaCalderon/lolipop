ActiveAdmin.register Language do

  permit_params :name, :status

  # Index page: custom columns displayed in the admin panel
  index do
    selectable_column
    id_column
    column :name
    column :status do |language|
      language.status == "active" ? "Active" : "Inactive"
    end
    actions
  end

  # Filters for search functionality in the index page
  filter :name
  filter :status, as: :select, collection: Language.statuses.map { |key, value| [key.titleize, value] }

  # Form for creating/editing a language
  form do |f|
    f.inputs "Language Details" do
      f.input :name
      f.input :status, as: :select, collection: Language.statuses.keys
    end
    f.actions
  end

  # Show page for a language
  show do
    attributes_table do
      row :name
      row :status do |language|
        language.status.capitalize
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end

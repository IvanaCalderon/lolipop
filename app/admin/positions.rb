ActiveAdmin.register Position do

  permit_params :name, :risk_level, :min_salary, :max_salary, :status, :description
  config.per_page = 20

  index do
    selectable_column
    id_column
    column :name
    column :description do |position|
      truncate(position.description, length: 100) # Optional: Truncate long descriptions
    end
    column :risk_level do |position|
      position.risk_level.capitalize
    end
    column :min_salary
    column :max_salary
    column :status do |position|
      position.status.capitalize # Using the enum to display the correct status
    end
    actions
  end

  filter :name
  filter :risk_level, as: :select, collection: Position.risk_levels.keys
  filter :status, as: :select, collection: Position.statuses.keys # 

  form do |f|
    f.inputs "Position Details" do
      f.input :name
      f.input :description, as: :text
      f.input :risk_level, as: :select, collection: Position.risk_levels.keys.map { |key| [key.humanize, key] } # Maps enum keys to their humanized versions
      f.input :min_salary
      f.input :max_salary
      f.input :status, as: :select, collection: Position.statuses.keys.map { |key| [key.humanize, key] } # Maps enum keys to humanized labels
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :risk_level do |position|
        position.risk_level.capitalize
      end
      row :min_salary
      row :max_salary
      row :status do |position|
        position.status.capitalize # Using the enum to display the correct status
      end
    end
    active_admin_comments
  end
  
end

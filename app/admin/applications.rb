ActiveAdmin.register Application do
    permit_params :status
  
    index do
      selectable_column
      id_column
      column :candidate
      column :position
      column :status
      actions
    end
  
    form do |f|
      f.inputs "Application Details" do
        f.input :status, as: :select, collection: Application.statuses.keys.map { |s| [s.humanize, s] }
      end
      f.actions
    end
  
    show do
      attributes_table do
        row :candidate
        row :position
        row :status
      end
    end
  end
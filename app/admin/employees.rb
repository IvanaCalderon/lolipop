ActiveAdmin.register Employee do
    permit_params :cedula, :name, :user_id, :hire_date, :department_id, :position_id, :monthly_salary, :status

    filter :cedula
    filter :name
    filter :position
    filter :monthly_salary
    filter :status, as: :select, collection: Employee.statuses.map { |key, value| [ key.titleize, value ] }

    form do |f|
        if f.object.errors.any?
        div class: "errors" do
            h2 "There are errors preventing this employee from being saved:"
            ul do
            f.object.errors.full_messages.each do |msg|
                li msg
            end
            end
        end
        end
        f.inputs "Employee Details" do
        f.input :user, as: :select, collection: User.all.map { |u| [ u.email, u.id ] }
        f.input :cedula
        f.input :name
        f.input :hire_date, as: :datepicker
        f.input :position
        f.input :monthly_salary
        f.input :status, as: :select, collection: Employee.statuses.keys.map { |s| [ s.humanize, s ] }
        end

        f.actions
    end

    show do
        attributes_table do
        row :user
        row :cedula
        row :name
        row :hire_date
        row :department
        row :position
        row :monthly_salary
        row :status
        end
    end
end

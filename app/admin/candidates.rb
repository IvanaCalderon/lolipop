ActiveAdmin.register Candidate do
   permit_params :cedula, :name, :user_id, :department_id, :position_id, :desired_salary, :recommended_by, competency_ids: [],
                trainings_attributes: [ :id, :description, :level, :start_date, :end_date, :institution, :_destroy ],
                job_experiences_attributes: [ :id, :company, :position, :start_date, :end_date, :salary, :_destroy ]

  form do |f|
    if f.object.errors.any?
      div class: "errors" do
        h2 "There are errors preventing this candidate from being saved:"
        ul do
          f.object.errors.full_messages.each do |msg|
            li msg
          end
        end
      end
    end
    f.inputs "Candidate Details" do
      f.input :user, as: :select, collection: User.all.map { |u| [ u.email, u.id ] }
      f.input :cedula
      f.input :name
      f.input :position, as: :select, collection: Position.all.map { |p| [ p.name, p.id ] }, include_blank: false
      f.input :desired_salary
      f.input :recommended_by
      f.input :competencies, as: :check_boxes, collection: Competency.all.map { |c| [ c.description, c.id ] }, input_html: { multiple: true }
    end

    f.inputs "Trainings" do
      f.has_many :trainings, allow_destroy: true do |t|
        t.input :description
        t.input :level, as: :select, collection: Training.levels.keys
        t.input :start_date, as: :datepicker
        t.input :end_date, as: :datepicker
        t.input :institution
      end
    end

    f.inputs "Job Experiences" do
      f.has_many :job_experiences, allow_destroy: true do |je|
        je.input :company
        je.input :position
        je.input :start_date, as: :datepicker
        je.input :end_date, as: :datepicker
        je.input :salary
      end
    end

    f.actions
  end

  show do
    attributes_table do
      row :user
      row :cedula
      row :name
      row :position
      row :department
      row :desired_salary
      row :recommended_by

      # Mostrar Competencias
      row "Competencias" do |candidate|
        candidate.competencies.map(&:description).join(", ")
      end

      # Mostrar Capacitaciones (Trainings)
      panel "Capacitaciones" do
        table_for candidate.trainings do
          column "Descripción", :description
          column "Nivel", :level
          column "Fecha de Inicio", :start_date
          column "Fecha de Fin", :end_date
          column "Institución", :institution
        end
      end

      # Mostrar Experiencias Laborales (Job Experiences)
      panel "Experiencias Laborales" do
        table_for candidate.job_experiences do
          column "Empresa", :company
          column "Puesto Ocupado", :position
          column "Fecha de Inicio", :start_date
          column "Fecha de Fin", :end_date
          column "Salario", :salary
        end
      end
    end
    active_admin_comments
  end
end

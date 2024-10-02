ActiveAdmin.register Application do
    permit_params :status
    filter :candidate
    filter :position
    filter :status, as: :select, collection: Application.statuses.map { |key, value| [ key.titleize, value ] }

    member_action :accept, method: :patch do
      application = Application.find(params[:id])
      candidate = application.candidate

      # Cambiamos el estado a "accepted" y creamos el empleado
      if application.update(status: "accepted")
        Employee.create!(
          user: candidate.user,
          cedula: candidate.cedula,
          name: candidate.name,
          hire_date: Date.today, # Fecha de ingreso actual
          position: application.position, # Puesto de la aplicación
          monthly_salary: candidate.desired_salary, # Salario deseado
          status: :active # El empleado está activo
        )
        redirect_to admin_application_path(application), notice: "Application accepted and employee created!"
      else
        redirect_to admin_application_path(application), alert: "There was an error accepting the application."
      end
    end

    member_action :reject, method: :patch do
      application = Application.find(params[:id])

      # Cambiamos el estado a "rejected"
      if application.update(status: "rejected")
        redirect_to admin_application_path(application), notice: "Application rejected."
      else
        redirect_to admin_application_path(application), alert: "There was an error rejecting the application."
      end
    end

   # Definir los action items para Accept y Reject con clases personalizadas
   action_item :accept, only: :show, if: proc { application.pending? } do
    link_to "Accept Application", accept_admin_application_path(resource), method: :patch, class: "button button-accept"
  end

  action_item :reject, only: :show, if: proc { application.pending? } do
    link_to "Reject Application", reject_admin_application_path(resource), method: :patch, class: "button button-reject"
  end

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
        f.input :status, as: :select, collection: Application.statuses.keys.map { |s| [ s.humanize, s ] }
      end
      f.actions
    end

    show title: proc { |application| "Application for #{application.candidate.name} - Position: #{application.position.name}" } do
      attributes_table do
        row :candidate
        row :position
        row :status
      end
      panel "Candidate Information" do
        attributes_table_for application.candidate do
          row :cedula
          row :name
          row :desired_salary do
            number_to_currency(application.candidate.desired_salary)
          end
          row :recommended_by
          row :languages do
            application.candidate.languages.map(&:name).join(", ")
          end
          row :competencies do
            application.candidate.competencies.map(&:description).join(", ")
          end
        end
      end

      panel "Job Experiences" do
        table_for application.candidate.job_experiences do
          column "Company", :company
          column "Position", :position
          column "Start Date", :start_date
          column "End Date", :end_date
          column "Salary" do |job|
            number_to_currency(job.salary)
          end
        end
      end

      panel "Trainings" do
        table_for application.candidate.trainings do
          column "Description", :description
          column "Level", :level
          column "Institution", :institution
          column "Start Date", :start_date
          column "End Date", :end_date
        end
      end
    end
  end

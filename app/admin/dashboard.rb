# frozen_string_literal: true

ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    panel "Pending Applications" do
      applications = Application.pending # Obtener solo las aplicaciones en estado "pending"

      if applications.any?
        table_for applications do
          column("Candidate") { |application| application.candidate.name }
          column("Position") { |application| application.position.name }
          column("Date Applied") { |application| application.created_at.strftime("%B %d, %Y") }
          column("Actions") do |application|
            link_to "View", admin_application_path(application)
          end
        end
      else
        div class: "blank_slate" do
          span "No pending applications."
        end
      end
    end

    panel "Employees" do
      employees = Employee.active # Obtener solo los empleados activos

      if employees.any?
        table_for employees do
          column("Name") { |employee| employee.name }
          column("Position") { |employee| employee.position.name }
          column("Hire Date") { |employee| employee.hire_date.strftime("%B %d, %Y") }
          column("Monthly Salary") { |employee| number_to_currency(employee.monthly_salary) }
          column("Actions") do |employee|
            link_to "View", admin_employee_path(employee)
          end
        end
      else
        div class: "blank_slate" do
          span "No active employees."
        end
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end

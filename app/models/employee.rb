class Employee < ApplicationRecord
  belongs_to :position
  belongs_to :user
  has_one :department, through: :position

  enum status: { inactive: 0, active: 1 }

  validates :cedula, :name, :hire_date, :monthly_salary, :status, presence: true

  # Define ransackable_attributes
  def self.ransackable_attributes(auth_object = nil)
    [ "cedula", "name", "position_id", "monthly_salary", "status", "user_id", "department_id" ]
  end

  # Optionally, define ransackable_associations if needed
  def self.ransackable_associations(auth_object = nil)
    []
  end
end

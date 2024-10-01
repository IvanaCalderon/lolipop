class Employee < ApplicationRecord
  belongs_to :position
  belongs_to :user
  has_one :department, through: :position

  enum status: { inactive: 0, active: 1 }

  validates :cedula, :name, :hire_date, :monthly_salary, :status, presence: true
end

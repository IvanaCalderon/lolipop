class Candidate < ApplicationRecord
  belongs_to :user
  belongs_to :position
  belongs_to :department # Esto asegura que cada candidato está relacionado con un departamento
  has_and_belongs_to_many :competencies
  has_and_belongs_to_many :languages
  has_many :trainings, dependent: :destroy
  has_many :job_experiences, dependent: :destroy

  validates :cedula, :name, :position, :department, :desired_salary, presence: true

  accepts_nested_attributes_for :trainings, allow_destroy: true
  accepts_nested_attributes_for :job_experiences, allow_destroy: true

  # Establece el departamento automáticamente cuando se selecciona un puesto
  before_validation :set_department

  def self.ransackable_attributes(auth_object = nil)
    [ "cedula", "name", "position_id", "desired_salary", "recommended_by", "user_id", "department_id", "position_id", "competencies_id", "trainings_id", "job_experiences_id", "languages_id" ]
  end

  # Optionally, define ransackable_associations if needed
  def self.ransackable_associations(auth_object = nil)
    []
  end


  private

  def set_department
    if position.present? && position.department.present?
      self.department = position.department
    else
      errors.add(:department, "must be selected through position")
    end
  end
end

class Candidate < ApplicationRecord
  belongs_to :user

  has_and_belongs_to_many :competencies
  has_and_belongs_to_many :languages
  has_many :trainings, dependent: :destroy
  has_many :job_experiences, dependent: :destroy

  validates :cedula, :name, :desired_salary, presence: true
  validates :desired_salary, numericality: { greater_than_or_equal_to: 0 }

  accepts_nested_attributes_for :trainings, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :job_experiences, allow_destroy: true, reject_if: :all_blank

  validates :cedula, format: { with: /\A\d{11}\z/, message: "must have exactly 11 digits" }
  validate :valid_cedula_checksum


  def self.ransackable_attributes(auth_object = nil)
    [ "cedula", "name", "position_id", "desired_salary", "recommended_by", "user_id", "department_id", "position_id", "competencies_id", "trainings_id", "job_experiences_id", "languages_id" ]
  end

  # Optionally, define ransackable_associations if needed
  def self.ransackable_associations(auth_object = nil)
    []
  end


  private

  # Verificar el checksum de la cédula dominicana
  def valid_cedula_checksum
    return if cedula.blank? || !cedula.match(/\A\d{11}\z/) # Validar solo si tiene 11 dígitos

    multipliers = [ 1, 2 ] # Alternar multiplicadores 1 y 2
    sum = 0

    # Recorrer los primeros 10 dígitos y aplicar la fórmula
    cedula.chars.first(10).each_with_index do |digit, index|
      product = digit.to_i * multipliers[index % 2]
      sum += product < 10 ? product : product - 9
    end

    # Obtener el dígito verificador
    checksum_digit = (10 - (sum % 10)) % 10

    unless checksum_digit == cedula[-1].to_i
      errors.add(:cedula, "is not valid")
    end
  end
end

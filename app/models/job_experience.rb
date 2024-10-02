class JobExperience < ApplicationRecord
    belongs_to :candidate

    validates :company, :position, :start_date, :end_date, :salary, presence: true
    validate :start_date_before_end_date
    validates :salary, numericality: { greater_than: 0 }

    private

    # Validación personalizada para asegurar que la fecha de inicio sea anterior a la fecha de fin
    def start_date_before_end_date
        if start_date.present? && end_date.present? && start_date >= end_date
            errors.add(:start_date, "must be before the end date")
        end
    end
end

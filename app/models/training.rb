class Training < ApplicationRecord
    belongs_to :user
    enum level: { grado: 0, post_grado: 1, maestria: 2, doctorado: 3, tecnico: 4, gestion: 5 }

    validates :description, :level, :start_date, :end_date, :institution, presence: true
    validate :start_date_before_end_date

    private

    def start_date_before_end_date
        if start_date.present? && end_date.present? && start_date >= end_date
        errors.add(:start_date, "must be before the end date")
        end
    end

end

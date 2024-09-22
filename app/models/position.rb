class Position < ApplicationRecord
    
    enum risk_level: { low: 0, mid: 1, high: 2 }
    enum status: { inactive: 0, active: 1 }

    validates :name, presence: true
    validates :min_salary, :max_salary, numericality: { greater_than_or_equal_to: 0 }
    validates :risk_level, inclusion: { in: risk_levels.keys }
    validates :description, presence: true, length: { maximum: 500 }
    


    # Ensure max_salary is greater than min_salary
    validate :max_salary_greater_than_min_salary

     # Define ransackable_attributes
    def self.ransackable_attributes(auth_object = nil)
        ["name", "risk_level", "min_salary", "max_salary", "status"]
    end

    # Optionally, define ransackable_associations if needed
    def self.ransackable_associations(auth_object = nil)
        []
    end

    private

    def max_salary_greater_than_min_salary
        if max_salary <= min_salary
        errors.add(:max_salary, "debe ser mayor que el salario mínimo")
        end
    end
end

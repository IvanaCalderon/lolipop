class Competency < ApplicationRecord
    enum status: { inactive: 0, active: 1 }

    validates :description, presence: true, uniqueness: true
    validates :status, inclusion: { in: statuses.keys }
    has_and_belongs_to_many :candidates

    def self.ransackable_attributes(auth_object = nil)
        [ "description", "status" ]
    end

    def self.ransackable_associations(auth_object = nil)
        []
    end
end

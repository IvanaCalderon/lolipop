class Department < ApplicationRecord
    has_many :positions, dependent: :destroy

    enum status: { inactive: 0, active: 1 }

    validates :name, presence: true, uniqueness: true

    def self.ransackable_attributes(auth_object = nil)
        ["name", "status"]
    end

    def self.ransackable_associations(auth_object = nil)
        []
    end
end

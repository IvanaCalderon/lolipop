class Application < ApplicationRecord
  belongs_to :candidate
  belongs_to :position
  has_one :department, through: :position

  enum status: { pending: 0, accepted: 1, rejected: 2 }

  validates :candidate_id, :position_id, presence: true

  # Define ransackable_attributes
  def self.ransackable_attributes(auth_object = nil)
    [ "candidate_id", "position_id", "status", "department_id" ]
  end

  # Optionally, define ransackable_associations if needed
  def self.ransackable_associations(auth_object = nil)
    []
  end
end
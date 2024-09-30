class Candidate < ApplicationRecord
  belongs_to :user
  
  has_and_belongs_to_many :competencies
  has_and_belongs_to_many :languages
  has_many :trainings, dependent: :destroy
  has_many :job_experiences, dependent: :destroy

  validates :cedula, :name, :desired_salary, presence: true

  accepts_nested_attributes_for :trainings, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :job_experiences, allow_destroy: true, reject_if: :all_blank


  def self.ransackable_attributes(auth_object = nil)
    [ "cedula", "name", "position_id", "desired_salary", "recommended_by", "user_id", "department_id", "position_id", "competencies_id", "trainings_id", "job_experiences_id", "languages_id" ]
  end

  # Optionally, define ransackable_associations if needed
  def self.ransackable_associations(auth_object = nil)
    []
  end


  private


end

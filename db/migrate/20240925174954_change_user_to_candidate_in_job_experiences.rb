class ChangeUserToCandidateInJobExperiences < ActiveRecord::Migration[7.2]
  def change
    remove_reference :job_experiences, :user, foreign_key: true
    add_reference :job_experiences, :candidate, foreign_key: true
  end
end

class ChangeUserToCandidateInTrainings < ActiveRecord::Migration[7.2]
  def change
    remove_reference :trainings, :user, foreign_key: true
    add_reference :trainings, :candidate, foreign_key: true
  end
end

class CreateJoinTableCandidatesCompetencies < ActiveRecord::Migration[7.2]
  def change
    create_join_table :candidates, :competencies do |t|
      # t.index [:candidate_id, :competency_id]
      # t.index [:competency_id, :candidate_id]
    end
  end
end

class CreateJoinTableCandidatesLanguages < ActiveRecord::Migration[7.2]
  def change
    create_join_table :candidates, :languages do |t|
      # t.index [:candidate_id, :language_id]
      # t.index [:language_id, :candidate_id]
    end
  end
end

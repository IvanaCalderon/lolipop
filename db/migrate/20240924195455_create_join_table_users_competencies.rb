class CreateJoinTableUsersCompetencies < ActiveRecord::Migration[7.2]
  def change
    create_join_table :users, :competencies do |t|
      # t.index [:user_id, :competency_id]
      # t.index [:competency_id, :user_id]
    end
  end
end

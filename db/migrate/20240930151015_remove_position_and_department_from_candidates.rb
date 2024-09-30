class RemovePositionAndDepartmentFromCandidates < ActiveRecord::Migration[7.2]
  def change
    remove_column :candidates, :position_id, :integer
    remove_column :candidates, :department_id, :integer
  end
end

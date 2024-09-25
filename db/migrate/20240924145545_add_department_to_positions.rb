class AddDepartmentToPositions < ActiveRecord::Migration[7.2]
  def change
    add_reference :positions, :department, null: false, foreign_key: true
  end
end

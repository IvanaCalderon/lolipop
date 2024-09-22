class CreatePositions < ActiveRecord::Migration[7.2]
  def change
    create_table :positions do |t|
      t.string :name
      t.integer :risk_level
      t.decimal :min_salary
      t.decimal :max_salary
      t.integer :status

      t.timestamps
    end
  end
end

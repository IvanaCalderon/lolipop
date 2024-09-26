class CreateCandidates < ActiveRecord::Migration[7.2]
  def change
    create_table :candidates do |t|
      t.references :user, null: false, foreign_key: true
      t.string :cedula
      t.string :name
      t.references :position, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true
      t.decimal :desired_salary
      t.string :recommended_by

      t.timestamps
    end
  end
end

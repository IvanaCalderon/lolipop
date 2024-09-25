class CreateCompetencies < ActiveRecord::Migration[7.2]
  def change
    create_table :competencies do |t|
      t.string :description
      t.integer :status

      t.timestamps
    end
  end
end

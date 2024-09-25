class CreateTrainings < ActiveRecord::Migration[7.2]
  def change
    create_table :trainings do |t|
      t.string :description
      t.integer :level
      t.date :start_date
      t.date :end_date
      t.string :institution

      t.timestamps
    end
  end
end

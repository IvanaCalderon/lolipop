class CreateJobExperiences < ActiveRecord::Migration[7.2]
  def change
    create_table :job_experiences do |t|
      t.string :company
      t.string :position
      t.date :start_date
      t.date :end_date
      t.decimal :salary

      t.timestamps
    end
  end
end

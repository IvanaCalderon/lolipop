class CreateEmployees < ActiveRecord::Migration[7.2]
  def change
    create_table :employees do |t|
      t.string :cedula
      t.string :name
      t.date :hire_date
      t.references :position, null: false, foreign_key: true
      t.decimal :monthly_salary
      t.integer :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

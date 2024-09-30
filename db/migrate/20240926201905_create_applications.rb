class CreateApplications < ActiveRecord::Migration[7.2]
  def change
    create_table :applications do |t|
      t.references :candidate, null: false, foreign_key: true
      t.references :position, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end

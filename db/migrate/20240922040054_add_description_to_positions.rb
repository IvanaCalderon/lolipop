class AddDescriptionToPositions < ActiveRecord::Migration[7.2]
  def change
    add_column :positions, :description, :text
  end
end

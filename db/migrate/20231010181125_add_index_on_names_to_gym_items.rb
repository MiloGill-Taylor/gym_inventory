class AddIndexOnNamesToGymItems < ActiveRecord::Migration[7.0]
  def change
    add_index :gym_items, :name, unique: true
  end
end

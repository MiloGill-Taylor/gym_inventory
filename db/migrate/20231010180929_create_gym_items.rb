class CreateGymItems < ActiveRecord::Migration[7.0]
  def change
    create_table :gym_items do |t|
      t.string :name
      t.text :description
      t.string :focus
      t.boolean :in_use, default: false

      t.timestamps
    end
  end
end

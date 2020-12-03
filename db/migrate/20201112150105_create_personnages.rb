class CreatePersonnages < ActiveRecord::Migration[6.0]
  def change
    create_table :personnages do |t|
      t.string :name
      t.string :class
      t.string :race
      t.integer :niveau

      t.timestamps
    end
  end
end

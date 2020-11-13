class CreateObjets < ActiveRecord::Migration[6.0]
  def change
    create_table :objets do |t|
      t.string :name
      t.integer :stat1
      t.integer :stat2
      t.string :rarety

      t.timestamps
    end
  end
end

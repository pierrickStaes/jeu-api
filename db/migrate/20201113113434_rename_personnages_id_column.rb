class RenamePersonnagesIdColumn < ActiveRecord::Migration[6.0]
  def change
  	  	rename_column :objets, :personnages_id, :personnage_id
  end
end

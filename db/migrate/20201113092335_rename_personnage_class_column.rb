class RenamePersonnageClassColumn < ActiveRecord::Migration[6.0]
  def change
  	rename_column :personnages, :class, :personnage_class
  end
end

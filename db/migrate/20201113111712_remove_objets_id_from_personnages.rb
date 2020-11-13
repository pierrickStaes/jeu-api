class RemoveObjetsIdFromPersonnages < ActiveRecord::Migration[6.0]
  def change
  	remove_column :personnages, :objets_id 
  end
end

class AddObjetToPersonnage < ActiveRecord::Migration[6.0]
  def change
  	  	add_reference :personnages, :objets, index: true
  end
end

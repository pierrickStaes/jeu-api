class AddToPersonnageToObjet < ActiveRecord::Migration[6.0]
  def change
  	add_reference :objets, :personnages, index: true
  end
end

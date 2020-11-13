json.extract! @personnages, :id, :name, :personnage_class, :niveau, :created_at

	json.objets @objets do |objet|
		json.extract! objet, :id, :name, :stat1, :stat2, :rarety
	
end
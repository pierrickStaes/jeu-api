json.array! @objets do |objet|
	json.extract! objet, :id, :name, :stat1, :stat2, :rarety, :created_at, :personnage_id
end
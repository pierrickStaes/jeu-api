json.array! @personnages do |personnage|
	json.extract! personnage, :id, :name, :personnage_class, :niveau, :created_at
end
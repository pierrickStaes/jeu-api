class Personnage < ApplicationRecord
	has_many :objets, dependent: :destroy
	include PgSearch  
	pg_search_scope :search, 
					against: [:name, :niveau, :personnage_class], 
					using: { 
						tsearch: { prefix: true }
					}
end

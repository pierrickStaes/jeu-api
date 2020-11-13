class Personnage < ApplicationRecord
	has_many :objets, dependent: :destroy
end

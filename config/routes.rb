Rails.application.routes.draw do

	namespace :api, defaults: {format: :json} do
		namespace :v1 do
			resources :personnages, only: [:index, :show, :update, :create, :destroy] do
				resources :objets, only: [:index, :show, :update, :create, :destroy]
			end
		end
	end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

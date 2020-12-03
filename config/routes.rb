
Swagger::Docs::Config.base_api_controller = ActionController::API
include Swagger::Docs::ImpotentMethods

Rails.application.routes.draw do

  devise_for :users
	namespace :api, defaults: {format: :json} do
		namespace :v1 do
			devise_scope :user do
		        post "sign_up", to: "registrations#create"
		        post "sign_in", to: "sessions#create"
      		end
			resources :personnages, only: [:index, :show, :update, :create, :destroy] do
				resources :objets, only: [:index, :show, :update, :create, :destroy]
			end
		end
	end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

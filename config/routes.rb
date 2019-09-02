Rails.application.routes.draw do
  
  root 'events#index'
  devise_for :users 
  resources :users do
  resources :photo, only: [:create] 
	end
  resources :events do
  resources :attandances, only: [:index, :new, :create]
  end
  resources :events do
  resources :avatars, only: [:create]
	end
  post '/attandances/:event_id/free', to: 'attandances#free'
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

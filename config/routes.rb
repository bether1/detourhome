Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :trips, only: [:index, :show]
  namespace :traveler do
    resources :trips, only: [:new, :create, :show] do
      resources :destinations, only: [:new, :create, :show] do
        resources :journals, only: :create
        resources :photos, only: :create
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

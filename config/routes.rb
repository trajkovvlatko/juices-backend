Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :admins
  mount_devise_token_auth_for 'User', at: 'users', controllers: {
    registrations: 'registrations',
    sessions: 'sessions'
  }

  namespace :admin_panel do
    resources :tags
    resources :categories
    resources :recipes
    resources :ingredients
  end

  resources :recipes, only: [:index, :show]
  resources :likes, only: [:create, :destroy]
  get 'current_user', to: 'current_user#show'
  get 'favorites', to: 'recipes#favorites'
  root to: 'home#index'
end

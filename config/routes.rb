Rails.application.routes.draw do
  resources :role_permissions
  resources :permissions
  root to: "categories#index"
  
  resources :categories, shallow: true do
    resources :topics, shallow: true do
      resources :posts      
    end
  end

  resources :users, shallow: true do
    resources :user_roles
  end
  
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :roles, shallow: true do
    end
  
  resources :attachments
  resources :media

  resources :setting_groups
  resources :settings
end

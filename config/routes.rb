Rails.application.routes.draw do
  root to: "categories#index"
  patch "/editable", to: "editables#update"

  resources :groups
  
  resources :categories, shallow: true do
    resources :topics, shallow: true do
      resources :posts      
    end
  end

  resources :users, shallow: true do
    resources :user_roles
    resources :user_groups
  end
  resources :roles, shallow: true do
    resources :role_permissions
  end
  resources :permissions
    
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  resources :attachments
  resources :media

  resources :setting_groups, shallow: true do
    resources :settings
  end
end

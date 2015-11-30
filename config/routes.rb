Rails.application.routes.draw do
  root to: "categories#index"
  
  resources :categories, shallow: true do
    resources :topics, shallow: true do
      resources :posts      
    end
  end

  resources :users, shallow: true do
    resources :user_roles
  end

  resources :permissions
  resources :roles, shallow: true do
    resources :role_permissions
  end
  
  resources :attachments
  resources :media

  resources :setting_groups
  resources :settings
end

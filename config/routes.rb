Rails.application.routes.draw do

  # Application root 
  root to: 'pages#index'
  
  get '/users/:id/dashboard', to: 'users#dashboard'
  get '/organizations/:id/manage_members', to: 'organizations#manage_members'

  # Devise Routes
  devise_for :users,
             controllers: {
               registrations: 'nms_devise/registrations',
               sessions: 'nms_devise/sessions'}

  # Model CRUD routes
  resources :users 
  
  resources :organizations do
    post '/organizations/:organization_id/memberships/:id' => 'memberships#leadership_status'
    resources :memberships
  end

  resources :articles

end

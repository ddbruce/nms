Rails.application.routes.draw do

  # Application root 
  root to: 'pages#index'
  
  get '/users/:id/dashboard', to: 'users#dashboard'
  get '/organizations/:id/manage_members', to: 'organizations#manage_members'
  get '/organizations/:id/edit_positions', to: 'organizations#edit_positions'

  # Devise Routes
  devise_for :users,
             controllers: {
               registrations: 'nms_devise/registrations',
               sessions: 'nms_devise/sessions'}

  resources :users 
  
  resources :organizations do
    post '/organizations/:organization_id/memberships/:id' => 'memberships#leadership_status'
    post 'join'
    post 'moderate_membership'
    resources :memberships do
      patch 'add_position'
    end
    resources :positions
  end

  resources :sections do
    post 'toggle_visibility'
  end
  
  resources :articles

  resources :medias
  resources :photos

end

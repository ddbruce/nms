Rails.application.routes.draw do

  # Application root 
  root to: 'pages#index'
  # 
  get '/users/:id/dashboard', to: 'users#dashboard'

  # Devise Routes
  devise_for :users,
             controllers: {
               registrations: 'nms_devise/registrations',
               sessions: 'nms_devise/sessions'}

  # Model CRUD routes
  resources :users
  resources :organizations
  resources :memberships

end

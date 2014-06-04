Rails.application.routes.draw do

  # Application root 
  root to: 'pages#index'

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

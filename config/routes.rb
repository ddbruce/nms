Rails.application.routes.draw do
  resources :users
  resources :organizations

  root to: 'pages#index'
end

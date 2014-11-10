Rails.application.routes.draw do
  resources :companies

  resources :users

  resources :charges
end
